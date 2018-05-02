function [ dft, x_dft, Nsamps, Fs ] = audio_dft(audio)
%AUDIO_DFT This function performs DFT of the audio files.
%   INPUT: audio: Audio file in .wav format.
%
%   OUTPUT:  
%        dft: Discrete Fourier Transform. The DFT spectrum will go from
%        X(0)...X(N/2-1), since x(n) is a real signal and therefore it
%        gives an even X(f) transform. 
%        Reference: 2.1 DFT Spectrum, Fujishima Paper
%           
%        x_dft: Vector containing the frequency bins of the DFT.
%
%        Nsamps: Number os samples of the dft.        
%        
%        Fs = Sampling frequency. 

[y,Fs] = audioread(audio);

Nsamps = length(y);

%Do Fourier Transform
dft = fft(y);                   %Retain Magnitude
dft = dft(1:Nsamps/2);        %Discard Half of Points
x_dft = Fs*(0:Nsamps/2-1)/Nsamps;   %Prepare freq data for plot



end

