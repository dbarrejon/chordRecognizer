function [labels] = labeler(names)
%LABELER This function generates de labels for each chord. Depending on the
%chord name, the function will assign the associated label.
%   Input
%       names: vector containing the names of the chords.
%   Output
%       labels: class labels for each chord.
% 

% LABELS: We use numeric labels in order to plot the confusion matrix
% later. With char labels it did not work.
%
% Label mapping: A Am Bm C D Dm E Em F G 
CHORD_LABELS = [1,2,3,4,5,6,7,8,9,10];
% CHORD_LABELS = {'a','am','bm','c','d','dm','e','em','f','g'};
labels = zeros(1,length(names));

for i = 1:1:length(names)      
    switch names{i}(1)
        case 'a'
                  % Minor
                  if strcmp('m', names{i}(2))
                      labels(i) = CHORD_LABELS(2);
                  else
                      labels(i) = CHORD_LABELS(1);
                  end

        case 'b'
            labels(i) = CHORD_LABELS(3);
        case 'c'
            labels(i) = CHORD_LABELS(4);
        case 'd'
                  % Minor
                  if strcmp('m', names{i}(2))
                      labels(i) = CHORD_LABELS(6);
                  else
                      labels(i) = CHORD_LABELS(5);
                  end
        case 'e'
                 % Minor
                  if strcmp('m', names{i}(2))
                      labels(i) = CHORD_LABELS(8);
                  else
                      labels(i) = CHORD_LABELS(7);
                  end
        case 'f'
            labels(i) = CHORD_LABELS(9);
        case 'g'
            labels(i) = CHORD_LABELS(10);
    end
        
        
end

