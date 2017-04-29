function [winners, output_regret] = subjective_set(profile,k)
% Later use SOSTYPE and SOSIND etc to further optimize

try
	[n,m] = size(profile);
	indY = @(i,r) (i-1)*(m-k+1)+r+m;
	indX = @(i) i;

	nIneq = n*((m-k+2)*(m-k+3)/2-1)+nchoosek(m,k);
	nEq = 1;
	nVar = m+n*(m-k+1)+1;

	Aineq = zeros(nIneq,nVar);
	bineq = zeros(nIneq,1);
	Aeq = zeros(nEq,nVar);
	beq = zeros(nEq,1);
	f = zeros(nVar,1);
	ctype = repmat('B',1,nVar);
	ctype(end) = 'C';

	% Objective Function: Minimize M
	f(end) = 1;

	% Equality Constraint: Sum of all X variables is 1
	Aeq(1:m) = 1; % 
	beq = k;

	% Inequality Constraints: 
	countIneq = 1;
	% First, let's set the variables Y_(i,r)
	for i=1:n
	    for r=1:m-k+1
	        for j=1:r % profile(i,j) should be false
	            Aineq(countIneq,indY(i,r)) = 1;
	            Aineq(countIneq,indX(profile(i,j))) = 1;
	            bineq(countIneq) = 1;
	            countIneq = countIneq + 1;
	        end
	        Aineq(countIneq,indY(i,r)) = -1;
	        for j=1:r
	            Aineq(countIneq,indX(profile(i,j))) = -1;
	        end
	        bineq(countIneq) = -1;
	        countIneq = countIneq + 1;
	    end
	end

	% Now the constraint for each T
	list_T = nchoosek(1:m,k);
	for indT = 1:size(list_T,1)
	    T = list_T(indT,:);

	    [I,J] = find(ismember(profile,T));
	    [~,ind] = unique(I,'first');
	    first_indices_T = J(ind);
	    
	    Aineq(countIneq,nVar) = -1;
	    for i=1:n
	        Aineq(countIneq,indY(i,first_indices_T(i))) = 1/first_indices_T(i);
	    end
	    countIneq = countIneq + 1;
	end

	options=cplexoptimset();
    options.Display = 'off';
    options.MIPDisplay = 0;
    options.NodeDisplayInterval = 0;
	[x,output_regret,exitflag] = cplexmilp(f,Aineq,bineq,Aeq,beq,[],[],[],zeros(nVar,1),[],ctype,[],options);
	assert(exitflag > 0);
	winners = find(x(1:m) > 1e-3);
    output_regret = output_regret/n; % Scale the regret so that the *total* value placed by all voters on all alternatives is 1
	assert(length(winners)==k);
catch
 	% In case of any troubles, use the naive implementation
	[winners, output_regret] = subjective_set_naive(profile,k);
end

end