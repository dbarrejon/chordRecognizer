validfunction [sigma_minerr, sigma_min] = cv_multisvm(TrainingSet,GroupTrain, sigmas)
%Function that computes cross validation to get the optimum sigma in an rbf
%kernel multiclass SVM

%   INPUTS:
%       TrainingSet - Xtrain SamplesxFeatures matrix
%       GroupTrain - Xtrain labels vector
%       Sigmas - Vector of sigmas to be optimized

%   OUTPUTS:
%       sigma_min - sigma value that minimizes the error
%       sigma_minerr - error associated to sigma_min

indices = crossvalind('Kfold', GroupTrain,5);

sigma_error = zeros(length(sigmas),1);
for i = 1:length(sigmas)
    %5-fold Cross Validation
    scores = zeros(5,1);
    error_multiSVM = zeros(5,1);
    for K = 1:5
        test = (indices == K); train = ~test;
        %Multi SVM model generation for each fold       
        result = multisvm(TrainingSet(train,:),GroupTrain(train,:)...
                     ,TrainingSet(test,:), sigmas(i));
        
        scores(K) = mean(result == GroupTrain(test,:));
        error_multiSVM(K) = 1-scores(K);
    end
    sigma_error(i) = mean(error_multiSVM);
end

[sigma_minerr, sigma_idx] = min(sigma_error);
sigma_min = sigmas(sigma_idx);
end

