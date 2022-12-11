n = 50;
% Frequencias a las que queremos la amplitud marcada por a
f = [0 0.3 0.4 0.5 0.6 1];
a = [0 0 1 1 0 0];

num1 = firpm(n, f, a);
num2 = firls(n, f, a);

subplot(1,2,1);
freqz(num1, 1);
subtitle('Filtro FIR Praks-McLelland');

subplot(1,2,2);
freqz(num2, 1);
subtitle('Filtro FIR Least-Squares Error');
