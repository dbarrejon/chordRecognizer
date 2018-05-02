%% EXAMPLE PCP
% This script shows a basic PCP representation of an a chord, both noise
% free and noisy.
%
%
%

notes = {'c';'c#';'d';'d#';'e';'f';'f#';'g';'g#';'a';'a#';'b'};
chords = {'c';'d';'dm';'e';'em';'f';'g';'a';'am';'bm'};

a1 = '../jim2012Chords/Guitar_Only/a/a_noisefree/a1.wav';
a101 = '../jim2012Chords/Guitar_Only/a/a_noisy/a101.wav';

    [dft1, x_dft1, Nsamps1, Fs1] = audio_dft(a1);
    pcp1 = pcp(dft1, Nsamps1, Fs1);
    
    [dft2, x_dft2, Nsamps2, Fs2] = audio_dft(a101);
    pcp2 = pcp(dft2, Nsamps2, Fs2);
    
    subplot(1,2,1)
        bar(pcp1)
        title('Noisefree a');
        legend({'Noisefree a'},'Location','northeast')
        set(gca,'xticklabel',notes)
    subplot(1,2,2)
        bar(pcp2)
        title('Noisy a');
        legend({'Noisy'},'Location','northeast')
        set(gca,'xticklabel',notes)