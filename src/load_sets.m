%% LOAD SETS
%
% In this script we obtain the different sets we will use in the
% experiments. These sets are stored in .mat files format, containing the
% features (PCP), the labels, and also the name and full path of every
% chord.
% 
% It is implemented so that it is compatible in unix and windows OS.

clear all;
close all;


nf_path = '../jim2012Chords/Experiments/noisefree/';
ny_path = '../jim2012Chords/Experiments/noisy/';
guitar_path = '../jim2012Chords/Experiments/Other_Instruments/Guitar/';
piano_path = '../jim2012Chords/Experiments/Other_Instruments/Piano/';
violin_path = '../jim2012Chords/Experiments/Other_Instruments/Violin/';
accordion_path = '../jim2012Chords/Experiments/Other_Instruments/Accordion/';
    
if ismac || isunix
    % Code to run on Mac plaform
elseif ispc
    % Code to run on Windows platform
    nf_path = strrep(nf_path,'/','\');
    ny_path = strrep(ny_path,'/','\');
    guitar_path = strrep(nf_path,'/','\');
    piano_path = strrep(nf_path,'/','\');
    violin_path = strrep(nf_path,'/','\');
    accordion_path = strrep(nf_path,'/','\');
else
    disp('Platform not supported')
end 

%% STEP 1: Get the struct file with all wav files for all the subsets

nf_struct = dir(strcat(nf_path,'*.wav'));
ny_struct = dir(strcat(ny_path,'*.wav'));
guitar_struct = dir(strcat(guitar_path,'*.wav'));
piano_struct = dir(strcat(piano_path,'*.wav'));
violin_struct = dir(strcat(violin_path,'*.wav'));
accordion_struct = dir(strcat(accordion_path,'*.wav'));

%% STEP 2: Generation of experiment sets.
size_nfSet = length(nf_struct);
size_nySet = length(ny_struct);

% We divide the different sets into two train/test sets with random
% indexes.
nf_ind = randperm(size_nfSet);
ny_ind = randperm(size_nfSet);
trainInd_nf = nf_ind(1:700);
testInd_nf = nf_ind(701:end);

trainInd_ny = ny_ind(1:700);
testInd_ny = ny_ind(701:end);

% SETS Structs with the followinf fields:
%   names: names of the wav files.
%   path: full path name for each wav file.
%   labels: labels for each wav file.
%   features: PCP vector for each wav file. It is computed below.

% SUBSET
%
% NOISE FREE
% TRAIN
nf_train.names = extractfield(nf_struct(trainInd_nf),'name');
nf_train.path = strcat(nf_path, nf_train.names);
nf_train.labels = labeler(nf_train.names)';
% TEST
nf_test.names = extractfield(nf_struct(testInd_nf),'name');
nf_test.path = strcat(nf_path, nf_test.names);
nf_test.labels = labeler(nf_test.names);


% NOISY
% TRAIN
ny_train.names = extractfield(ny_struct(trainInd_ny),'name');
ny_train.path = strcat(ny_path, ny_train.names);
ny_train.labels = labeler(ny_train.names)';
% TEST
ny_test.names = extractfield(ny_struct(testInd_ny),'name');
ny_test.path = strcat(ny_path, ny_test.names);
ny_test.labels = labeler(ny_test.names);

% MIXED
% TRAIN
mix_train.names = [nf_train.names, ny_train.names];
mix_train.path = [nf_train.path, ny_train.path];
mix_train.labels = [nf_train.labels, ny_train.labels];
% Randomize the indexes for the mixed set
mixtrain_indx = randperm(length(mix_train.names));
mix_train.names = mix_train.names(mixtrain_indx);
mix_train.path = mix_train.path(mixtrain_indx);
mix_train.labels = mix_train.labels(mixtrain_indx)';

% SUBSET 2
% GUITAR
guitar.names = extractfield(guitar_struct,'name');
guitar.path = strcat(guitar_path, guitar.names);
guitar.labels = labeler(guitar.names)';
% PIANO
piano.names = extractfield(piano_struct,'name');
piano.path = strcat(piano_path, piano.names);
piano.labels = labeler(piano.names)';
% VIOLIN
violin.names = extractfield(violin_struct,'name');
violin.path = strcat(violin_path, violin.names);
violin.labels = labeler(violin.names)';
% ACCORDION
accordion.names = extractfield(accordion_struct,'name');
accordion.path = strcat(accordion_path, accordion.names);
accordion.labels = labeler(accordion.names)';

%% STEP 3: Compute the PCP features 

tic

% PCP for NoiseFree Train Set (70%)
nf_train_samples = length(nf_train.names);
for i = 1:1:nf_train_samples
    
    [dft, x_dft, Nsamps, Fs] = audio_dft(nf_train.path{i});
    pcp_feature = pcp(dft, Nsamps, Fs);
    nf_train.features{i} = pcp_feature;

end
nf_train.features = cell2mat(nf_train.features');
save('nf_train','nf_train');

% PCP for Noisy Train Set (70%)
ny_train_samples = length(ny_train.names);
for i = 1:1:ny_train_samples
    
    [dft, x_dft, Nsamps, Fs] = audio_dft(ny_train.path{i});
    pcp_feature = pcp(dft, Nsamps, Fs);
    ny_train.features{i} = pcp_feature;

end
ny_train.features = cell2mat(ny_train.features');
save('ny_train','ny_train');

% PCP for NoiseFree Test Set (30%)
nf_test_samples = length(nf_test.names);
for i = 1:1:nf_test_samples
    
    [dft, x_dft, Nsamps, Fs] = audio_dft(nf_test.path{i});
    pcp_feature = pcp(dft, Nsamps, Fs);
    nf_test.features{i} = pcp_feature;

end
nf_test.features = cell2mat(nf_test.features');
save('nf_test','nf_test');

% PCP for Noisy Test Set (30%)
ny_test_samples = length(ny_test.names);
for i = 1:1:ny_test_samples
    
    [dft, x_dft, Nsamps, Fs] = audio_dft(ny_test.path{i});
    pcp_feature = pcp(dft, Nsamps, Fs);
    ny_test.features{i} = pcp_feature;

end
ny_test.features = cell2mat(ny_test.features');
save('ny_test','ny_test');

% PCP for Mixed Train Set (70%)
for i = 1:1:length(mixtrain_indx)
    
    [dft, x_dft, Nsamps, Fs] = audio_dft(mix_train.path{i});
    pcp_feature = pcp(dft, Nsamps, Fs);
    mix_train.features{i} = pcp_feature;

end
mix_train.features = cell2mat(mix_train.features');
save('mix_train','mix_train');


% SUBSET 2 (lengths are 100)

% PCP for guitar
for i = 1:1:length(guitar.names)
    
    [dft, x_dft, Nsamps, Fs] = audio_dft(guitar.path{i});
    pcp_feature = pcp(dft, Nsamps, Fs);
    guitar.features{i} = pcp_feature;

end
guitar.features = cell2mat(guitar.features');
save('guitar','guitar');

% PCP for piano
for i = 1:1:length(piano.names)
    
    [dft, x_dft, Nsamps, Fs] = audio_dft(piano.path{i});
    pcp_feature = pcp(dft, Nsamps, Fs);
    piano.features{i} = pcp_feature;

end
piano.features = cell2mat(piano.features');
save('piano','piano');

% PCP for violin
for i = 1:1:length(violin.names)
    
    [dft, x_dft, Nsamps, Fs] = audio_dft(violin.path{i});
    pcp_feature = pcp(dft, Nsamps, Fs);
    violin.features{i} = pcp_feature;

end
violin.features = cell2mat(violin.features');
save('violin','violin');

% PCP for accordion
for i = 1:1:length(accordion.names)
    
    [dft, x_dft, Nsamps, Fs] = audio_dft(accordion.path{i});
    pcp_feature = pcp(dft, Nsamps, Fs);
    accordion.features{i} = pcp_feature;

end
accordion.features = cell2mat(accordion.features');
save('accordion','accordion');

tiempinho =  toc;
