function [ideal_matrix] = ideal_pcp()
%Generate the ideal pcp vectors matrix
%   Takes the first, third and fifth note of every chord
%   The chords are:
%   C D Dm E Em F G A Am Bm

ideal_matrix = zeros(10, 12);
% Default value.
val = 0.7;
first = [1, 3, 3, 5, 5, 6, 8, 10, 10, 12];

    for i = 1:1:10
        ideal_matrix(i, first(i)) = val;
        % Minor chords
        if(i == 3 || i == 5 || i == 9 || i == 10)
            third = mod(first(i)+3, 12);
        else
        % Major chords
            third = mod(first(i)+4, 12);
        end
        
        % Fix condition for C chord.
        if third == 0
           third = 12; 
        end
        
        ideal_matrix(i, third) = val;
        fifth = mod(first(i)+7, 12);
        if fifth == 0
           fifth = 12; 
        end
        ideal_matrix(i, fifth) = val;
    end
    
end

