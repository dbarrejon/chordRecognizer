%% IDEAL REPRESENTATION PCP

clear all; close all;

% Initial Values
NUM_CHORDS = 10;
notes = {'c';'c#';'d';'d#';'e';'f';'f#';'g';'g#';'a';'a#';'b'};
chords = {'c';'d';'dm';'e';'em';'f';'g';'a';'am';'bm'};

ideal = ideal_pcp;


figure('Name','Ideal PCP Chords','NumberTitle','off')

for i = 1:1:NUM_CHORDS
    subplot(5,2,i)
        bar(ideal(i,:))
        title(chords{i})
        set(gca,'xticklabel',notes)
        ylim([0 1])
end

%% COMPARISON IDEAL PCP AND SOME CHORDS FROM DATA BASE

% CHORDS

% 1. Obtain the samples full path to compute the pcp.

    a1 = '../jim2012Chords/Experiments/noisefree/a1.wav';
    a101 = '../jim2012Chords/Experiments/noisy/a101.wav';

    am1 = '../jim2012Chords/Experiments/noisefree/am1.wav';
    am101 = '../jim2012Chords/Experiments/noisy/am101.wav';

    bm1 = '../jim2012Chords/Experiments/noisefree/bm1.wav';
    bm101 = '../jim2012Chords/Experiments/noisy/bm101.wav';

    c1 = '../jim2012Chords/Experiments/noisefree/c1.wav';
    c101 = '../jim2012Chords/Experiments/noisy/c101.wav';

    d1 = '../jim2012Chords/Experiments/noisefree/d1.wav';
    d101 = '../jim2012Chords/Experiments/noisy/d101.wav';

    dm1 = '../jim2012Chords/Experiments/noisefree/dm1.wav';
    dm101 = '../jim2012Chords/Experiments/noisy/dm101.wav';

    e1 = '../jim2012Chords/Experiments/noisefree/e1.wav';
    e101 = '../jim2012Chords/Experiments/noisy/e101.wav';

    em1 = '../jim2012Chords/Experiments/noisefree/em1.wav';
    em101 = '../jim2012Chords/Experiments/noisy/em101.wav';

    f1 = '../jim2012Chords/Experiments/noisefree/f1.wav';
    f101 = '../jim2012Chords/Experiments/noisy/f101.wav';

    g1 = '../jim2012Chords/Experiments/noisefree/g1.wav';
    g101 = '../jim2012Chords/Experiments/noisy/g101.wav';
    
    samples = {c1,c101,d1,d101,dm1,dm101,e1,e101,em1,...
           em101,f1,f101,g1,g101,a1,a101,am1,am101,bm1,bm101};
if ismac || isunix
    % Code to run on Mac plaform
    % The default code works.
elseif ispc
    % Code to run on Windows platform
    for i = 1:1:length(samples)
        samples{i} = strrep(samples{i},'/','\');
    end
else
    disp('Platform not supported')
    return
end 


% PCP AND PLOT      
% 2. Compute PCP and Plot the samples comparing to the ideal representation
% We will plot in a 5x2 plot the different samples, where each row is a
% different chord sample and column 1 is a noisefree sample and the second
% raw is a noisy sample.

figure('Name','Comparison PCP Chords','NumberTitle','off')
width_ideal = 0.5;
j = 1;

for i = 1:2:length(samples)-1
    
    if i==NUM_CHORDS+1
        figure('Name','Comparison PCP Chords','NumberTitle','off')
    end
    
    [dft1, x_dft1, Nsamps1, Fs1] = audio_dft(samples{i});
    pcp1 = pcp(dft1, Nsamps1, Fs1);
    
    [dft2, x_dft2, Nsamps2, Fs2] = audio_dft(samples{i+1});
    pcp2 = pcp(dft2, Nsamps2, Fs2);
    
    subplot(5,2,mod(i,NUM_CHORDS))
        bar([pcp1', ideal(j,:)' ])
        title(chords{j});
        legend({'PCP Chord','Ideal PCP'},'Location','northeast')
        set(gca,'xticklabel',notes)
    subplot(5,2,mod(i,NUM_CHORDS)+1)
        bar([pcp2', ideal(j,:)' ])
        title(chords{j});
        legend({'PCP Chord','Ideal PCP'},'Location','northeast')
        set(gca,'xticklabel',notes)
    
    j = j+1;
end
