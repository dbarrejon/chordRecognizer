%% EXPERIMENTS SVM
%                                     SUBSET 1
%                   Learning Set(70%)          Test Set(30%)
%   Experiment 1:     Noise Free                Noise Free
%   Experiment 2:     Noise Free                   Noisy
%   Experiment 3:       Noisy                   Noise Free
%   Experiment 4:       Noisy                      Noisy
%   Experiment 5:       Mixed                   Noise Free
%   Experiment 6:       Mixed                      Noisy
%                                     SUBSET 2
%                   Learning Set                 Test Set
%   Experiment 7:       Mixed                     Guitar
%   Experiment 8:       Mixed                     Piano
%   Experiment 9:       Mixed                     Violin
%   Experiment 10:      Mixed                     Accordion

    

%% Part 1. Optimization of hyperparameters by cross validation and prediction
% 
% For the optimization of hyperparameteres we have used a cross validation
% procedure. The parameter we have optimized is the sigma of the gaussian
% brf kernel. After trying different ranges of sigma, we have obtained that
% the range below provides the optimal result. More precisely, the optimal
% sigma we have found is sigma = 2.35
% 
% For this optimization we have chosen the mixed learning set because it
% provides a global view of our database and it is a more real-world set. 

load('nf_test.mat')
load('ny_test.mat')
load('nf_train.mat')
load('ny_train.mat')
load('mix_train.mat')
load('guitar.mat')
load('piano.mat')
load('violin.mat')
load('accordion.mat')
% 
sigmas = [2.35,2.36,2.37,2.38,2.39,2.40];
% 
% Optimal Sigma: 2.35
% 
%[nf_sigma_minerr, nf_sigma_min] = cv_multisvm(nf_train.features,nf_train.labels, sigmas);
%[ny_sigma_minerr, ny_sigma_min] = cv_multisvm(ny_train.features,ny_train.labels, sigmas);
[mix_sigma_minerr, mix_sigma_min] = cv_multisvm(mix_train.features,mix_train.labels, sigmas);

% EXPERIMENT 1

pred1 = multisvm(nf_train.features, nf_train.labels,nf_test.features, mix_sigma_min);

% EXPERIMENT 2

pred2 = multisvm(nf_train.features, nf_train.labels,ny_test.features, mix_sigma_min);

% EXPERIMENT 3

pred3 = multisvm(ny_train.features, ny_train.labels, nf_test.features, mix_sigma_min);

% EXPERIMENT 4

pred4 = multisvm(ny_train.features, ny_train.labels, ny_test.features, mix_sigma_min);

% EXPERIMENT 5

pred5 = multisvm(mix_train.features, mix_train.labels, nf_test.features, mix_sigma_min);

% EXPERIMENT 6

pred6 = multisvm(mix_train.features, mix_train.labels, ny_test.features, mix_sigma_min);

% EXPERIMENT 7

pred7 = multisvm(mix_train.features, mix_train.labels, guitar.features, mix_sigma_min);

% EXPERIMENT 8

pred8 = multisvm(mix_train.features, mix_train.labels, piano.features, mix_sigma_min);

% EXPERIMENT 9

pred9 = multisvm(mix_train.features, mix_train.labels, violin.features, mix_sigma_min);

% EXPERIMENT 10

pred10 = multisvm(mix_train.features, mix_train.labels, accordion.features, mix_sigma_min);


%% 2. Plot Confusion Matrix

CHORD_LABELS = {'a','am','bm','c','d','dm','e','em','f','g'};

% True classes
targetNoisefree = nf_test.labels;
targetNoisy = ny_test.labels; 
targetGuitar = guitar.labels';
targetPiano = piano.labels';
targetViolin = violin.labels';
targetAccordion = accordion.labels';

% Experiment 1: Confusion Matrix

    outputsVector = pred1'; % Predicted classes
    % Convert this data to a [numClasses x 6] matrix
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
    
% Experiment 7: Confusion Matrix

    outputsVector = pred7'; % Predicted classes
    targets = zeros(10,length(targetGuitar));
    outputs = zeros(10,length(outputsVector));
    targetsIdx = sub2ind(size(targets), targetGuitar, ...
                         1:length(targetGuitar));
    outputsIdx = sub2ind(size(outputs), outputsVector,...
                         1:length(outputsVector));
    targets(targetsIdx) = 1;
    outputs(outputsIdx) = 1;

    figure
    plotconfusion(targets,outputs)
    % Customize the axis with the class labels.
    title('Experiment 7: LS: Mixed / TS: Guitar (Subset 2)');
    h = gca;
    h.XTickLabel = CHORD_LABELS;
    h.YTickLabel = CHORD_LABELS;
    h.YTickLabelRotation = 90;    

% Experiment 8: Confusion Matrix

    outputsVector = pred8'; % Predicted classes
    targets = zeros(10,length(targetPiano));
    outputs = zeros(10,length(outputsVector));
    targetsIdx = sub2ind(size(targets), targetPiano, ...
                         1:length(targetPiano));
    outputsIdx = sub2ind(size(outputs), outputsVector,...
                         1:length(outputsVector));
    targets(targetsIdx) = 1;
    outputs(outputsIdx) = 1;

    figure
    plotconfusion(targets,outputs)
    % Customize the axis with the class labels.
    title('Experiment 8: LS: Mixed / TS: Piano (Subset 2)');
    h = gca;
    h.XTickLabel = CHORD_LABELS;
    h.YTickLabel = CHORD_LABELS;
    h.YTickLabelRotation = 90;    

% Experiment 9: Confusion Matrix

    outputsVector = pred9'; % Predicted classes
    targets = zeros(10,length(targetViolin));
    outputs = zeros(10,length(outputsVector));
    targetsIdx = sub2ind(size(targets), targetViolin, ...
                         1:length(targetViolin));
    outputsIdx = sub2ind(size(outputs), outputsVector,...
                         1:length(outputsVector));
    targets(targetsIdx) = 1;
    outputs(outputsIdx) = 1;

    figure
    plotconfusion(targets,outputs)
    % Customize the axis with the class labels.
    title('Experiment 9: LS: Mixed / TS: Violin (Subset 2)');
    h = gca;
    h.XTickLabel = CHORD_LABELS;
    h.YTickLabel = CHORD_LABELS;
    h.YTickLabelRotation = 90;    

% Experiment 10: Confusion Matrix

    outputsVector = pred10'; % Predicted classes
    targets = zeros(10,length(targetAccordion));
    outputs = zeros(10,length(outputsVector));
    targetsIdx = sub2ind(size(targets), targetAccordion, ...
                         1:length(targetAccordion));
    outputsIdx = sub2ind(size(outputs), outputsVector,...
                         1:length(outputsVector));
    targets(targetsIdx) = 1;
    outputs(outputsIdx) = 1;

    figure
    plotconfusion(targets,outputs)
    % Customize the axis with the class labels.
    title('Experiment 10: LS: Mixed / TS: Accordion (Subset 2)');
    h = gca;
    h.XTickLabel = CHORD_LABELS;
    h.YTickLabel = CHORD_LABELS;
    h.YTickLabelRotation = 90;    
    