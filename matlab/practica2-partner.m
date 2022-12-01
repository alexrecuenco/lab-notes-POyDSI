L = 6001; % 1001 para incluir el 0 y que Ts sea 0,1
t = linspace(0,6,L);
Ts = 6/(L-1); %0,001
Fs = 1/Ts; %1000

f = 1;
x = square(2*pi*f*t);

plot(t,x);
ylim([-0.1,1.1])
xlabel('Tiempo (s)')


freq =[1, 1.5, 4];
n = 6;
alfap = 0.7; %Menor que 1 dB
alfas = 30; %Entre 20 y 40 dB

[num,den] = butter(n, 2*pi*1, "low", "s");
g = tf(num,den);
yb_1 = lsim(g, x, t);

[num,den] = butter(n, 2*pi*1.5, "low", "s");
g = tf(num,den);
yb_15 = lsim(g, x, t);

[num,den] = butter(n, 2*pi*4, "low", "s");
g = tf(num,den);
yb_4 = lsim(g, x, t);



[num,den] = cheby1(n, alfap, 2*pi*1, "low", "s");
g = tf(num,den);
ych1_1 = lsim(g, x, t);

[num,den] = cheby1(n, alfap, 2*pi*1.5, "low", "s");
g = tf(num,den);
ych1_15 = lsim(g, x, t);

[num,den] = cheby1(n, alfap, 2*pi*4, "low", "s");
g = tf(num,den);
ych1_4 = lsim(g, x, t);



[num,den] = cheby2(n, alfas, 2*pi*1, "low", "s");
g = tf(num,den);
ych2_1 = lsim(g, x, t);

[num,den] = cheby2(n, alfas, 2*pi*1.5, "low", "s");
g = tf(num,den);
ych2_15 = lsim(g, x, t);

[num,den] = cheby2(n, alfas, 2*pi*4, "low", "s");
g = tf(num,den);
ych2_4 = lsim(g, x, t);


[num,den] = ellip(n, alfap, alfas, 2*pi*1, "low", "s");
g = tf(num,den);
yellip_1 = lsim(g, x, t);

[num,den] = ellip(n, alfap, alfas, 2*pi*1.5, "low", "s");
g = tf(num,den);
yellip_15 = lsim(g, x, t);

[num,den] = ellip(n, alfap, alfas, 2*pi*4, "low", "s");
g = tf(num,den);
yellip_4 = lsim(g, x, t);


subplot(4,3,1)

yall = [yb_1, yb_15, yb_4, ych1_1, ych1_15, ych1_4, ych2_1, ych2_15, ych2_4, yellip_1, yellip_15, yellip_4];
[m,ym] = size(yall); % La columna m es la m-ésima y de yall
for i=1:ym
    subplot(4,3,i)
    plot(t,yall(:, i))
end
sgtitle('Salidas de los distintos filtros')

%% EJERCICIO 2

% Entrada: Onda cuadrada
X=fft(x);
ff=linspace(0,Fs,L);
plot(ff, abs(X))
xlim([0,10]);
xlabel('Frecuencia (Hz)')

%%
% Filtros
ffcc = [1, 1.5, 4];
for i=1:length(ffcc)
    [num,den] = butter(n, 2*pi*ffcc(i), "low", "s");
    w = 2*pi*ff;
    [Hw] = freqs(num, den, w); %w normalizados entre 0 y pi
    subplot(2,3,i)
    plot(w/(2*pi), abs(Hw))
    xlabel('Frecuencia(Hz)')
    xlim([0,10])
    xticks(0:2:10)
end
hold on


% Salidas
yall = [yb_1, yb_15, yb_4];

[m,yi] = size(yall);
for i=1:yi
    subplot(2,3,i+3)
    Y=fft(yall(:, i));
    plot(ff, abs(Y))
    xlabel('Frecuencia(Hz)')
    xlim([0,10]); 
    xticks(0:2:10);
end
sgtitle('Filtros Butterworth y salidas')


%% EJERCICIO 3

% a)
w = 2;
L = 10001; % 1001 para incluir el 0 y que Ts sea 0,1
t = linspace(0,10,L);
Ts = 10/(L-1); %0,001
Fs = 1/Ts; %1000
y = sin(w*t) + 0.5*sin(3*w*t) + 0.3*sin(5*w*t);

Y = fft(y);
f = linspace(0,Fs,L);

subplot(1,2,1);
plot(t, y)
xlabel('Tiempo (s)')

subplot(1,2,2)
plot(2*pi*f,abs(Y))
xlim([0,20])
xlabel('Frecuencia angular (rad/s)')

%% b


% Primera componente: Elección del filtro y generación de la salida
n = 4;
wc = 2;
[num,den] = butter(n, wc, "low", "s");

w = 2*pi*f;
[Hw] = freqs(num, den, w);

g = tf(num,den);
y1 = lsim(g, y, t);
Y1 = fft(y1);

% Plots
posiciones1 = [1,2,3,4];
limitesx = [0,10];
dibujar(t,y1,f,Y1,w,Hw, posiciones1, limitesx)


% Segunda componente: Elección del filtro y generación de la salida
n = 4;
wc = [5,7];
[num,den] = butter(n, wc, "s");

w = 2*pi*f;
[Hw2] = freqs(num, den, w);

g = tf(num,den);
y2 = lsim(g, y, t);
Y2 = fft(y2);

% Plots
posiciones2 = [5,6,7,8];
dibujar(t,y2,f,Y2,w,Hw2, posiciones2, limitesx)


% Tercera componente: Elección del filtro y generación de la salida
n = 8;
wc = 10; 
[num,den] = butter(n, wc, 'high','s');

w = 2*pi*f;
[Hw3] = freqs(num, den, w);

g = tf(num,den);
y3 = lsim(g, y, t);
Y3 = fft(y3);

% Plots
posiciones3 = [9,10,11,12];
limitesx = [0,14];
dibujar(t,y3,f,Y3,w,Hw3, posiciones3, limitesx)


%% c)

y_rec = y1+y2+y3;
plot(t,y_rec)
xlabel('Tiempo(s)')




%% Función auxiliar

function dibujar(t,y1,f,Y1,w,Hw,posiciones,limitesx)
    % Plot de la salida (en tiempo y en frecuencia)
    subplot(3,4,posiciones(1))
    plot(t,y1)
    title('Salida (tiempo)')
    xlim([0,10])
    xticks(linspace(0,10,6))
    if posiciones == [9,10,11,12]
        xlabel('Tiempo(s)')
    end
    
    subplot(3,4,posiciones(2))
    plot(2*pi*f, abs(Y1))
    xlim(limitesx)
    xticks(linspace(min(limitesx), max(limitesx), 1+max(limitesx)/2))
    title('Salida(frecuencia)')
    if posiciones == [9,10,11,12]
        xlabel('Frecuencia (rad/s)')
    end
    
    % Plot del filtro (ángulo y fase)
    subplot(3,4,posiciones(3))
    plot(w, abs(Hw))
    xlim(limitesx)
    xticks(linspace(min(limitesx), max(limitesx), 1+max(limitesx)/2))
    ylim([-0.1, 1.1])
    title('Filtro (amplitud)')
    if posiciones == [9,10,11,12]
        xlabel('Frecuencia (rad/s)')
    end
    
    
    subplot(3,4,posiciones(4))
    plot(w, angle(Hw))
    xlim(limitesx)
    xticks(linspace(min(limitesx), max(limitesx), 1+max(limitesx)/2))
    title('Filtro (fase)')
    if posiciones == [9,10,11,12]
        xlabel('Frecuencia (rad/s)')
    end
    

    
end