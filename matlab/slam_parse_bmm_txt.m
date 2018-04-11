function [bing_mix_model, bing_mix_model_weights]= slam_parse_bmm_txt(txt_fname)

fid = fopen(txt_fname);
tline = fgetl(fid);
ctr = 0;

d = 4;
V_all={};
Z_all={};
F_all={};

while ischar(tline)
    if ctr==-1
        weights_cell = strsplit(tline, ' ');
        bing_mix_model_weights = cellfun(@str2double, weights_cell);
        bing_mix_model_weights = bing_mix_model_weights(1:end-1);
    end
    
    if mod(ctr,3)==1
        V_cell = strsplit(tline, ' ');
        V = cellfun(@str2double, V_cell);
        V = V(1:end-1);
        V_all{end+1} = reshape(V, [4,3]);
    end
    
    if mod(ctr,3)==2
        Z_cell = strsplit(tline, ' ');
        Z = cellfun(@str2double, Z_cell);
        Z_all{end+1} = Z(1:end-1)
    end
    
    if mod(ctr,3)==0 && ctr>0
        F = strsplit(tline, ' ')
        F_all{end+1} = str2double(F);
    end

    disp(tline)
    tline = fgetl(fid);
    ctr = ctr+1
end

curr_bingham = [];
bing_mix_model = [];

for idx=1:length(bing_mix_model_weights)
    curr_bingham = slam_create_bingham(d, V_all{idx}, Z_all{idx}, F_all{idx});
    bing_mix_model = [bing_mix_model; curr_bingham];
end

fclose(fid);

bing_mix_model = bing_mix_model';
bing_mix_model_weights = bing_mix_model_weights';

