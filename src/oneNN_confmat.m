%% EXPERIMENTS 1-NN
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



%% Part 1. Perform knn and predict for the different experiments.

load('nf_test.mat')
load('ny_test.mat')
load('nf_train.mat')
load('ny_train.mat')
load('mix_train.mat')
load('guitar.mat')
load('piano.mat')
load('violin.mat')
load('accordion.mat')

% Number of nearest-neighbours 
k = 1;

% EXPERIMENT 1

Mdl1 = fitcknn(nf_train.features, nf_train.labels,'NumNeighbors',k);
pred1 = predict(Mdl1,nf_test.features);


% EXPERIMENT 2

Mdl2 = fitcknn(nf_train.features, nf_train.labels,'NumNeighbors',k);
pred2 = predict(Mdl2,ny_test.features);


% EXPERIMENT 3

Mdl3 = fitcknn(ny_train.features, ny_train.labels,'NumNeighbors',k);
pred3 = predict(Mdl3,nf_test.features);

% EXPERIMENT 4

Mdl4 = fitcknn(ny_train.features, ny_train.labels,'NumNeighbors',k);
pred4 = predict(Mdl4,ny_test.features);

% EXPERIMENT 5

Mdl5 = fitcknn(mix_train.features, mix_train.labels,'NumNeighbors',k);
pred5 = predict(Mdl5,nf_test.features);

% EXPERIMENT 6

Mdl6 = fitcknn(mix_train.features, mix_train.labels,'NumNeighbors',k);
pred6 = predict(Mdl6,ny_test.features);

% EXPERIMENT 7

Mdl7 = fitcknn(mix_train.features, mix_train.labels,'NumNeighbors',k);
pred7 = predict(Mdl7,guitar.features);

% EXPERIMENT 8

Mdl8 = fitcknn(mix_train.features, mix_train.labels,'NumNeighbors',k);
pred8 = predict(Mdl8,piano.features);

% EXPERIMENT 9

Mdl9 = fitcknn(mix_train.features, mix_train.labels,'NumNeighbors',k);
pred9 = predict(Mdl9,violin.features);

% EXPERIMENT 10

Mdl10 = fitcknn(mix_train.features, mix_train.labels,'NumNeighbors',k);
pred10 = predict(Mdl10,accordion.features);

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
    