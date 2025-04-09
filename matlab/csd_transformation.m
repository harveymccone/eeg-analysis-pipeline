%% Script Setup %%
clear all

ID_list = [1, 3, 4, 7, 10, 12, 15, 17, 19, 21, 22, 23, 24, 26, 27, 28, 29, 30]; 
n = 1;
    
for i = n:length(ID_list)
    %% Loading in arrays of epoched data %%
    ID = strcat('P', string(ID_list(i)));
    
    filename = "Time_Reproduction_Data/Alternate_Artifact_Rejection/pre_interval_baseline/Epochs_Arrays/Encode/" + ID + "_Encode_All.mat";
    load(filename) 
    encode_epochs = encode_epochs_array; 
    
    filename = "Time_Reproduction_Data/Alternate_Artifact_Rejection/pre_interval_baseline/Epochs_Arrays/Reproduction/" + ID + "_Reproduction_All.mat";
    load(filename) 
    repo_epochs = repo_epochs_array; 
    
    filename = "Time_Reproduction_Data/Alternate_Artifact_Rejection/pre_interval_baseline/Epochs_Arrays/Response_Locked/" + ID + "_Response_Locked_All.mat";
    load(filename) 
    response_locked_epochs = response_locked_epochs_array;
    
    filename = "Time_Reproduction_Data/Alternate_Artifact_Rejection/pre_interval_baseline/Epochs_Arrays/Offset/" + ID + "_Offset_All.mat";
    load(filename)
    offset_epochs = offset_epochs_array;
    
    [n_channels, n_samples_encode, n_epochs_encode] = size(encode_epochs); % array is n_channels by n_samples by n_epochs
    n_epochs_repo = size(repo_epochs, 3);
    n_epochs_response_locked = size(response_locked_epochs, 3);
    n_epochs_offset = size(offset_epochs, 3);
    n_samples_repo = size(repo_epochs, 2);
    n_samples_response_locked = size(response_locked_epochs, 2);
    n_samples_offset = size(offset_epochs, 2);
    
    encode_epochs = encode_epochs * 1e6; % data are loaded in Volts (V), should they be converted to microvolts (uV) before applying CSD?
    repo_epochs = repo_epochs * 1e6;
    response_locked_epochs = response_locked_epochs * 1e6;
    offset_epochs = offset_epochs * 1e6;
    
    %% Applying CSD %%
    montage_filename = "CSD_Toolbox/CSDtoolbox/resource/chans.asc";
    lookup_filename = "CSD_Toolbox/CSDtoolbox/resource/cap128.csd";
    
    E = textread(montage_filename,'%s'); % read the montage you want
    M = ExtractMontage(lookup_filename,E);
    
    m = 4; % sets spherical spline stiffness, 4 is default
    [G,H] = GetGH(M,m);
    
    encode_epochs_CSD = ones(128, n_samples_encode, n_epochs_encode); % initialising output variable for CSD
    repo_epochs_CSD = ones(128, n_samples_repo, n_epochs_repo); % initialising output variable for CSD
    response_locked_epochs_CSD = ones(128, n_samples_response_locked, n_epochs_response_locked); % initialising output variable for CSD
    offset_epochs_CSD = ones(128, n_samples_offset, n_epochs_offset); % initialising output variable for CSD 
    
    for epoch = 1:n_epochs_encode % computing CSD for encode epochs
        encode_epochs_CSD(1:128, :, epoch) = CSD(encode_epochs(1:128, :, epoch), G, H);
    end
    
    for epoch = 1:n_epochs_repo % computing CSD for reproduction epochs
        repo_epochs_CSD(1:128, :, epoch) = CSD(repo_epochs(1:128, :, epoch), G, H);
    end
    
    for epoch = 1:n_epochs_response_locked % computing CSD for response locked epochs
        response_locked_epochs_CSD(1:128, :, epoch) = CSD(response_locked_epochs(1:128, :, epoch), G, H);
    end
    
    for epoch = 1:n_epochs_offset
        offset_epochs_CSD((1:128), :, epoch) = CSD(offset_epochs(1:128, :, epoch), G, H);
    end
    %% Saving Epochs With CSD Applied %%
    encode_CSD_filename = "Time_Reproduction_Data/Alternate_Artifact_Rejection/pre_interval_baseline/Epochs_Arrays_CSD/Encode/" + ID + "_Encode_All_CSD.mat";
    save(encode_CSD_filename, "encode_epochs_CSD")

    repo_CSD_filename = "Time_Reproduction_Data/Alternate_Artifact_Rejection/pre_interval_baseline/Epochs_Arrays_CSD/Reproduction/" + ID + "_Reproduction_All_CSD.mat";
    save(repo_CSD_filename, "repo_epochs_CSD")
    
    response_locked_CSD_filename = "Time_Reproduction_Data/Alternate_Artifact_Rejection/pre_interval_baseline/Epochs_Arrays_CSD/Response_Locked/" + ID + "_Response_Locked_All_CSD.mat";
    save(response_locked_CSD_filename, "response_locked_epochs_CSD")
    
    offset_CSD_filename = "Time_Reproduction_Data/Alternate_Artifact_Rejection/pre_interval_baseline/Epochs_Arrays_CSD/Offset/" + ID + "_Offset_All_CSD.mat";
    save(offset_CSD_filename, "offset_epochs_CSD")
end