%% EXPERIMENTS K-NN
% This script was used to check the optimal parameter for the k-NN
% algorithm. We tested with both the noise free and noisy learning set and
% after several iterations the best result we obtained was k = 1.
% The proper implementation is in implemented in the file oneNN_confmat.m
%
%
%
%                   Learning Set(70%)          Test Set(30%)
%   Experiment 1:     Noise Free                Noise Free
%   Experiment 2:     Noise Free                   Noisy
%   Experiment 3:       Noisy                   Noise Free
%   Experiment 4:       Noisy                      Noisy
%   Experiment 5:       Mixed                   Noise Free
%   Experiment 6:       Mixed                      Noisy

load('nf_test.mat')
load('ny_test.mat')
load('nf_train.mat')
load('ny_train.mat')
load('mix_train.mat')

%% Part 1. Optimization of hyperparameters by bayesian optimation

mix_k = 1;
nf_k = mix_k;
ny_k = mix_k;

% UNCOMMENT THE CODE BELOW TO PERFORM OPTIMIZATION
%
% Number of nearest-neighbours 
% k = [1,30];
% 
% % NOISE FREE LEARNING SET
%
%
% num = optimizableVariable('n',k, 'Type','integer');
% c = cvpartition(length(nf_train.features),'Kfold',5);
% fun = @(x)kfoldLoss(fitcknn(nf_train.features,nf_train.labels,...
%         'CVPartition',c,'NumNeighbors',x.n));
% results = bayesopt(fun,num,'Verbose',1,...
%           'AcquisitionFunctionName','expected-improvement-plus');
% 
% nf_k = results.XAtMinEstimatedObjective.n;
% 
% % NOISY LEARNING SET
% 
% num = optimizableVariable('n',k, 'Type','integer');
% c = cvpartition(length(ny_train.features),'Kfold',5);
% fun = @(x)kfoldLoss(fitcknn(ny_train.features,ny_train.labels,...
%         'CVPartition',c,'NumNeighbors',x.n));
% results = bayesopt(fun,num,'Verbose',1,...
%           'AcquisitionFunctionName','expected-improvement-plus');
% 
% ny_k = results.XAtMinEstimatedObjective.n;
% 
% % MIX LEARNING SET
%
% num = optimizableVariable('n',k, 'Type','integer');
% c = cvpartition(length(mix_train.features),'Kfold',5);
% fun = @(x)kfoldLoss(fitcknn(mix_train.features,mix_train.labels,...
%         'CVPartition',c,'NumNeighbors',x.n));
% results = bayesopt(fun,num,'Verbose',1,...
%           'AcquisitionFunctionName','expected-improvement-plus');
% 
% mix_k = results.XAtMinEstimatedObjective.n;
%
% We have concluded that the optimal k is given by the mixed learning set.
% nf_k = mix_k;
% ny_k = mix_k;
%
% EXPERIMENT 1

Mdl1 = fitcknn(nf_train.features, nf_train.labels,'NumNeighbors',nf_k);
pred1 = predict(Mdl1,nf_test.features);


% EXPERIMENT 2

Mdl2 = fitcknn(nf_train.features, nf_train.labels,'NumNeighbors',nf_k);
pred2 = predict(Mdl2,ny_test.features);


% EXPERIMENT 3

Mdl3 = fitcknn(ny_train.features, ny_train.labels,'NumNeighbors',nf_k);
pred3 = predict(Mdl3,nf_test.features);

% EXPERIMENT 4

Mdl4 = fitcknn(ny_train.features, ny_train.labels,'NumNeighbors',ny_k);
pred4 = predict(Mdl4,ny_test.features);

% EXPERIMENT 5

Mdl5 = fitcknn(mix_train.features, mix_train.labels,'NumNeighbors',mix_k);
pred5 = predict(Mdl5,nf_test.features);

% EXPERIMENT 6

Mdl6 = fitcknn(mix_train.features, mix_train.labels,'NumNeighbors',mix_k);
pred6 = predict(Mdl5,ny_test.features);


%% 2. Plot Confusion Matrix

CHORD_LABELS = {'a','am','bm','c','d','dm','e','em','f','g'};

% True classes
targetNoisefree = nf_test.labels;
targetNoisy = ny_test.labels; 

% Experiment 1: Confusion Matrix

    outputsVector = pred1'; % Predicted classes
    targets = zeros(10,length(targetNoisefree));
    outputs = zeros(10,length(outputsVector));
    targetsIdx = sub2ind(size(targets), targetNoisefree, ...
                        1:length(targetNoisefree));
    outputsIdx = sub2ind(size(outputs), outputsVector,...
                         1:length(outputsVector));
    targets(targetsIdx) = 1;
    outputs(outputsIdx) = 1;

    figure
    plotconfusion(targets,outputs)
    % Customize the axis with the class labels.
    title('Experiment 1: LS: Noisefree / TS: Noisefree');
    h = gca;
    h.XTickLabel = CHORD_LABELS;
    h.YTickLabel = CHORD_LABELS;
    h.YTickLabelRotation = 90;
    
% Experiment 2: Confusion Matrix

    outputsVector = pred2'; % Predicted classes
    targets = zeros(10,length(targetNoisy));
    outputs = zeros(10,length(outputsVector));
    targetsIdx = sub2ind(size(targets), targetNoisy, ...
                        1:length(targetNoisy));
    outputsIdx = sub2ind(size(outputs), outputsVector,...
                         1:length(outputsVector));
    targets(targetsIdx) = 1;
    outputs(outputsIdx) = 1;
    
    figure
    plotconfusion(targets,outputs)
    % Customize the axis with the class labels.
    title('Experiment 2: LS: Noisefree / TS: Noisy');
    h = gca;
    h.XTickLabel = CHORD_LABELS;
    h.YTickLabel = CHORD_LABELS;
    h.YTickLabelRotation = 90;
    
% Experiment 3: Confusion Matrix

    outputsVector = pred3'; % Predicted classes
    targets = zeros(10,length(targetNoisefree));
    outputs = zeros(10,length(outputsVector));
    targetsIdx = sub2ind(size(targets), targetNoisefree, ...
                        1:length(targetNoisefree));
    outputsIdx = sub2ind(size(outputs), outputsVector,....
                         1:length(outputsVector));
    targets(targetsIdx) = 1;
    outputs(outputsIdx) = 1;
    
    figure
    plotconfusion(targets,outputs)
    % Customize the axis with the class labels.
    title('Experiment 3: LS: Noisy / TS: Noisefree');
    h = gca;
    h.XTickLabel = CHORD_LABELS;
    h.YTickLabel = CHORD_LABELS;
    h.YTickLabelRotation = 90;
    
% Experiment 4: Confusion Matrix

    outputsVector = pred4'; % Predicted classes
    targets = zeros(10,length(targetNoisy));
    outputs = zeros(10,length(outputsVector));
    targetsIdx = sub2ind(size(targets), targetNoisy, ...
                        1:length(targetNoisy));
    outputsIdx = sub2ind(size(outputs), outputsVector,...
                         1:length(outputsVector));
    targets(targetsIdx) = 1;
    outputs(outputsIdx) = 1;
    
    figure
    plotconfusion(targets,outputs)
    % Customize the axis with the class labels.
    title('Experiment 4: LS: Noisy / TS: Noisy');
    h = gca;
    h.XTickLabel = CHORD_LABELS;
    h.YTickLabel = CHORD_LABELS;
    h.YTickLabelRotation = 90;
    
% Experiment 5: Confusion Matrix

outputsVector = pred5'; % Predicted classes
targets = zeros(10,length(targetNoisefree));
outputs = zeros(10,length(outputsVector));
targetsIdx = sub2ind(size(targets), targetNoisefree, ...
                    1:length(targetNoisefree));
outputsIdx = sub2ind(size(outputs), outputsVector,...
                     1:length(outputsVector));
targets(targetsIdx) = 1;
outputs(outputsIdx) = 1;

figure
plotconfusion(targets,outputs)
% Customize the axis with the class labels.
title('Experiment 5: LS: Mixed / TS: Noisefree');
h = gca;
h.XTickLabel = CHORD_LABELS;
h.YTickLabel = CHORD_LABELS;
h.YTickLabelRotation = 90;

% Experiment 6: Confusion Matrix

outputsVector = pred6'; % Predicted classes
targets = zeros(10,length(targetNoisy));
outputs = zeros(10,length(outputsVector));
targetsIdx = sub2ind(size(targets), targetNoisy, ...
                    1:length(targetNoisy));
outputsIdx = sub2ind(size(outputs), outputsVector,...
                     1:length(outputsVector));
targets(targetsIdx) = 1;
outputs(outputsIdx) = 1;

figure
plotconfusion(targets,outputs)
% Customize the axis with the class labels.
title('Experiment 6: LS: Mixed / TS: Noisy');
h = gca;
h.XTickLabel = CHORD_LABELS;
h.YTickLabel = CHORD_LABELS;
h.YTickLabelRotation = 90;
