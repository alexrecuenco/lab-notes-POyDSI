f = 800; % Hz
time = 5; %s
fsample=44100;
N=50;
t = linspace(0, 5.00001, fsample*time);

x = square(t*2*pi*f);

represent=0.005;

points=(1:(fsample*represent));

% fir hannin to extract fundamental frequency

w1 = 0.8 * f/ (fsample/2);
w2 = 1.2 * f/ (fsample/2);

b=fir1(N, [w1, w2], hamming(N + 1));

freqz(b,1, N);

filtered = filter(b, 1, x);

subplot(2,1,1)
plot(t(points), x(points))
xlabel("Time (s)")
subtitle("square wave (800Hz)")
title("Extrayendo la frequencia fundamental con pasa-banda FIR")


subplot(2,1,2)
plot(t(points), filtered(points))
xlabel("Time (s)")
subtitle("Frequencia fundamental extraída con fir1")



