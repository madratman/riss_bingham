function X = bingham_mixture_sample(BM,BM_weights,no_of_samples)
% X = bingham_mixture_sample(B,W,no_of_samples) - sample no_of_samples points from a Bingham
% mixture using Monte Carlo simulation


if no_of_samples==1
    % sample a mixture component
    i = pmf_sample(BM_weights);
    X = bingham_sample(BM(i), 1);
    
elseif no_of_samples<100
    for i=1:no_of_samples
        X(i,:) = bingham_mixture_sample(BM,BM_weights,1);
    end
else  % no_of_samples >= 100

    X = [];
    no_of_components = length(BM)
    for i=1:no_of_components
        no_of_samples_from_component(i) = round(no_of_samples*BM_weights(i))
    end
    no_of_estimated_samples = sum(no_of_samples_from_component)

    if (no_of_estimated_samples<no_of_samples)
        for i=no_of_estimated_samples:no_of_samples
            j = pmf_sample(BM_weights);
            no_of_samples_from_component(j) = no_of_samples_from_component(j) + 1;
        end
    else
        for i=no_of_samples:no_of_estimated_samples
            j = pmf_sample(BM_weights);
            no_of_samples_from_component(j) = no_of_samples_from_component(j) - 1;
        end
    end

    for i=1:no_of_components
        X = [X; bingham_sample(BM(i), no_of_samples_from_component(i))];
    end
end
