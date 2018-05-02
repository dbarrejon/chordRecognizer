function [ pcp ] = pcp( dft, Nsamps, Fs )
%PCP This function performs the Pitch Class Profile algorithm. 
%   Reference: Realtime Chord Recognition of Musical Sound: A system using
%   common lisp music, 1999. Fujishima.
%   Note: For the PCP implementation the paper operates in a 0-indexing
%   way. However, since Matlab starts at index 1, we don't evaluate at
%   index 0.
%
% Inputs:
%   dft: DFT of the input signal.
%   Nsamps: Number of samples
%   Fs: Sampling frequency.
%
% Output:
%   pcp: PCP 12-bin vector.

pcp = zeros(1,12);
M = map_to_index(Fs, Nsamps);

for p = 1:1:length(pcp)
    pcp(p) = sum(abs(dft(M==p)).^2);
end

% Normalization
pcp = pcp/sum(pcp);

    function M = map_to_index( Fs, Nsamps)
    %MAP_TO_INDEX 
    % The reference frequency we consider is a C = 130.8 Hz.
    f_ref = 130.8;
    len_dft = Nsamps/2 -1;
    l = 1:1:len_dft;
    M = mod(round(12*log2((Fs*l/Nsamps)/f_ref)),12) + 1;
    end

end
