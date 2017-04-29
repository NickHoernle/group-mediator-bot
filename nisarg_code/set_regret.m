function [regret] = set_regret(profile,S,T)
% Regret of set S for set T

if isempty(T)
    regret = 0;
    return
end

[I,J] = find(ismember(profile,S));
[~,ind] = unique(I,'first');
first_indices_S = J(ind);

[I,J] = find(ismember(profile,T));
[~,ind] = unique(I,'first');
first_indices_T = J(ind);

regret = sum((first_indices_T < first_indices_S).*(1./first_indices_T));
end