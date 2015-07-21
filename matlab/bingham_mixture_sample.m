function [X X2 X3]= bingham_mixture_sample(BM,BM_weights,no_of_samples)
% samples no_of_samples points from a Bingham mixture with weights BM_weights
% mixture using Monte Carlo simulation

% X -> just the samples

% Optional output arguments:
% X2 -> index of the corresponding component in the BM from where the sample was sampled from
% ^vector of length == no_of_samples
% X3 -> no of samples from each component(vector of length == no_of_components)

ind = zeros(no_of_samples, 1);
no_of_components = length(BM);
no_of_samples_from_component = zeros(no_of_components, 1);

if no_of_samples==1
    % sample a mixture component
    i = pmf_sample(BM_weights);
    X = bingham_sample(BM(i), 1);
    ind(i) = i;
    % no_of_samples_from_component = 1; %this line doesn't matter for no_of_samples>1. 

elseif no_of_samples<100
    for i=1:no_of_samples
        j = pmf_sample(BM_weights);
        X(i,:) = bingham_mixture_sample(BM(j),1,1);
        ind(i) = j;
        no_of_samples_from_component(j) = no_of_samples_from_component(j) + 1;
    end
else  % no_of_samples >= 100

    for i=1:no_of_components
        no_of_samples_from_component(i) = round(no_of_samples*BM_weights(i));
    end
    no_of_estimated_samples = sum(no_of_samples_from_component);
%     no_of_samples_from_component
;
    if (no_of_estimated_samples<no_of_samples)
        for i=no_of_estimated_samples:(no_of_samples-1)
%             i;
            j = pmf_sample(BM_weights);
            no_of_samples_from_component(j) = no_of_samples_from_component(j) + 1;
        end
    
    elseif (no_of_estimated_samples>no_of_samples)
        for i=(no_of_samples-1):no_of_estimated_samples
%             i
            j = pmf_sample(BM_weights);
            no_of_samples_from_component(j) = no_of_samples_from_component(j) - 1;
        end
    end
%     no_of_samples_from_component;
    
    X = [];
    for i=1:no_of_components
        X = [X; bingham_sample(BM(i), no_of_samples_from_component(i))];
%         bingham_sample(BM(i), no_of_samples_from_component(i))
%          no_of_samples_from_component(i)
%          BM(i).V
%         i
%         no_of_samples_from_component(i);
    end 

% Hack to fix bug. TODO check 
    % for i=1:no_of_components
    %     for j = 1:no_of_samples_from_component(i)
    %         X = [X; bingham_sample(BM(i), 1)];
    %         i;
    %         no_of_samples_from_component(i);
    %     end
    % end

    %to track origin of the sample
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