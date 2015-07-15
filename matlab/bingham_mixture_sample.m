function [X X2 X3]= bingham_mixture_sample(BM,BM_weights,no_of_samples)
% X = bingham_mixture_sample(B,W,no_of_samples) - sample no_of_samples points from a Bingham
% mixture using Monte Carlo simulation

ind = zeros(no_of_samples, 1);

if no_of_samples==1
    % sample a mixture component
    i = pmf_sample(BM_weights);
    X = bingham_sample(BM(i), 1);
    ind(i) = i;

elseif no_of_samples<100
    for i=1:no_of_samples
        i = pmf_sample(BM_weights);
        X(i,:) = bingham_mixture_sample(BM(i),1);
        ind(i) = i;
    end
else  % no_of_samples >= 100

    X = [];
    no_of_components = length(BM);
    for i=1:no_of_components
        no_of_samples_from_component(i) = round(no_of_samples*BM_weights(i));
    end
    no_of_estimated_samples = sum(no_of_samples_from_component);
    
    if (no_of_estimated_samples<no_of_samples)
        for i=no_of_estimated_samples:no_of_samples
            i;
            j = pmf_sample(BM_weights);
            no_of_samples_from_component(j) = no_of_samples_from_component(j) + 1;
        end
    
    elseif (no_of_estimated_samples>no_of_samples)
        for i=no_of_samples:no_of_estimated_samples
            i;
            j = pmf_sample(BM_weights);
            no_of_samples_from_component(j) = no_of_samples_from_component(j) - 1;
        end
    end
    
    for i=1:no_of_components
        X = [X; bingham_sample(BM(i), no_of_samples_from_component(i))];
        i;
        no_of_samples_from_component(i);
    end

    for j = 1:no_of_components
        last = 0;
        for i=1:no_of_samples_from_component(j)
            i;
            j;
            if i ~= no_of_samples_from_component(j)
                ind(i+last) = j;%TODO error at transitions
            end
            if i == no_of_samples_from_component(j)
                last = sum(no_of_samples_from_component(1:j));
                last;
                i;
                ind(last) = j;
            end
            last;
        end 
        i+last;
    end
    
    length(ind);
end

X2 = ind;
X3 = no_of_samples_from_component;