[sound, fs]=audioread("mel2_note.wav");
subplot(1,2,1);

spectrogram(sound);
title("Espectrograma")

time=0.05;
n=round(time*fs);
period = 1/fs;

brief_sound=sound(1:n);

% (np.arange(1, n + 1, dtype=int) // 2) / float(n * d)

% THIS IS CORRECT
freqs=(0:(n-1))/n*fs;
points = 1:round(n/2);
sound_fft = fft(brief_sound);
subplot(1,2,2)
plot(freqs(points),abs(sound_fft(points)));
title("Espectro de frequencias del primer 0.05 segundos")
xlabel("f (Hz)")


% Design notch filters, bu irrnotch, then combine all of them
f=440;

notches=[f, 3*f, 5*f];

w0=notches/(fs/2);
bw = w0/35;
comb=zeros(2,6);
for i=1:3
    [b,a] = iirnotch(w0(i),bw(i));
    comb(i,:)=[b,a];
end


filtered=sosfilt(comb, sound);

audiowrite('mel2_filtered.wav', filtered, fs)