function [winners, output_regret] = subjective_set_naive(profile,k)
% Minimax Regret Set (naive method)

[n,m] = size(profile);
list_subsets_size_k = nchoosek(1:m,k);
output_regret = Inf;

for sInd = 1:size(list_subsets_size_k,1)
    max_regret_for_S = 0;
    S = list_subsets_size_k(sInd,:);
    for tInd = 1:size(list_subsets_size_k,1)
        if tInd == sInd
            continue
        end
        T = list_subsets_size_k(tInd,:);
        max_regret_for_S = max(max_regret_for_S, set_regret(profile,S,T));
    end
    if output_regret > max_regret_for_S
        output_regret = max_regret_for_S;
        winners = S;
    end
end

output_regret = output_regret/n; % Scale the regret so that the *total* value placed by all voters on all alternatives is 1

end

def subjective_set_naive(profile, k):
    '''
    Minimax Regret Set (naive method)
    '''
