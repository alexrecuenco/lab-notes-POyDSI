[sound, fs] = audioread('mel1.wav');
[sound_noisy, fs_noisy] = audioread('mel1_noise.wav');

% Clearly contained within a very narrow margin

subplot(3,1,1)
plot_fft(sound, fs);
subplot(3,1,2);
plot_fft(sound_noisy, fs_noisy);
% player=audioplayer(sound, fs)
% playblocking(player)


specs=fdesign.lowpass('Fp,Fst,Ap,Ast',0.041,0.043,0.001,120);
opts=designopts(specs, 'kaiserwin');

designed_filter = design(specs,'kaiserwin', opts, 'SystemObject',true);
b = designed_filter.Numerator;

filtered = filter(b,1,sound_noisy);

subplot(3,1,3);
plot_fft(filtered, fs_noisy);


play_and_stop(filtered, fs_noisy)
% audiowrite('mel1_filtered.wav',filtered,fs_noisy)
function plot_fft(sound, fs)
    n = length(sound);
    f = (-n/2:n/2-1)*(fs/n);
    y=fftshift(fft(sound));
    plot(f * 2/fs,abs(y))
    xlabel('Frequency Normalized')
    ylabel('Magnitude')
end

function play_and_stop(sound, fs)
   player=audioplayer(sound, fs);
   playblocking(player);
end
