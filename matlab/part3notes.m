
%A. dB
% B. ds square
% #2 generetae 5s but only generate 0.05, 800Hz
% Generate square wave, represent in wave, listen to it
% Extract with hamming the fundamental harmonic
% #3 mel1, mel1.noise. identify noise representing both
blackman
% Y, X; Y, Xref; parts of ref will be lost by filtering
order = 50;
[signal, fs] = audioread('mel1.wav');
N = length(signal);
window = triang(order + 1);
wc = 500/ (fs/2); % The pi is implicit, a frequency cutoff of 500.
numerator = fir1(50, wc, 'high', window);
den = 1;

chebwin(50)
% NOTE: 
% transfer function
%     9/(40/2)
% For normalized frequency multiplication by pi is implied so 0.5 is really 0.5*pi or pi/2 radians/sample. Note that pi/2 radians/sample is 1/4 cycle/sample multiply that by 40 samples/sec and you get 10 cycles/sec or 10 Hz. Therefore a normalized frequency of 0.5(pi) is equal to 10 cycles/sec with a sampling frequency of 40 Hz.

%g = tf(numerator,den);
% y = lsim(g, y, t);


Ts = 1/fs;
t = 0:(N-1);
t = t * Ts;
plot(t,signal);
xlabel('Time (seconds)');
ylabel('Amplitude');


y = fft(signal);
f = (0:length(y)-1)*fs/length(y);

subplot(1,2, 1, 'replace')
frame = 1:(N/20);
abs_y = abs(y);
plot(f(frame),abs_y(frame));
xlabel('Frequency (Hz)')
ylabel('Magnitude')
title('Magnitude')

subplot(1,2,2, "replace");
filt_signal = filter(numerator, den, signal);


y = fft(filt_signal);
f = (0:length(y)-1)*fs/length(y);

frame = 1:(N/20);
abs_y = abs(y);
plot(f(frame),abs_y(frame));
xlabel('Frequency (Hz)')
ylabel('Magnitude')
title('Magnitude')

%window= triang(n+1)
% or hann
% or hamming
% or blackman
%chebwin
% numerator = fir1(N, wc, 'low', window)
% denominator = [1]
% wc \in (0, 1)
% freqz normalized 0, pi

% If filter without window. 
% ParML -> num = remez(N, F, A) frequence and amplitude vectors
% LSE -> num = firls(N, F, A). Freq [0, wp, ws, 1] A[1,1,0,0]


% sound(x, Fs) sampling frequency. note that it is not blocking.
% audioread
%y = filter(num, dem, x)
