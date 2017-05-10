
clear all;
close all;

%% sin
Fs =   3000%8*pi;%200; %% Частота дискретизации
%f0 = 10; %% частота синуса
t = 0 : 1/Fs: 2; %% Ось времени
A = 2; %% Амплитуда

phi = 20; %% Фаза
s = A * sin(2*pi*t);
sl2 = A * cos(2*pi*t + phi); %% Сигнал
% hold on

%plot(s)
% plot(sl2,'r')
% hold off

spectrum(Fs,t,s);
%% Многоканальный sin
Fs =   8e3;
t = 0:1/Fs:1;
t = t';
f = [600 800 1000 1200 1400];
s3 = cos(2*pi*t*f);
%figure; plot(t(1:100),s3(1:100,:));
spectrum(Fs,t,s3);
%%

% Затухающий sin
Fs =   8e3;
t = 0:1/Fs:1;
t = t';
A = 2;
f0 = 0.1e3;
phi = pi/4;
s1 = A * cos(2*pi*f0*t + phi);
alpha = 0.01e3;
s2 = exp(-alpha*t).*s1;
 spectrum(Fs,t,s2);
 %figure
 %plot(s2)
%  subplot(2,2,1): plot(s2(1:100))
%  subplot(2,2,2): plot(s2(1:100),'.')
%  subplot(2,2,3): stem(s2(1:100))
%  subplot(2,2,4): stairs(s2(1:100))

%% Кусочные зависимости 
Fs =   100;
t = 0:1/Fs:1;
% Односторонний экспоненциальный импульс
s = zeros (size (t));
inds = find(t >= 0);
s(inds) = A * exp (-alpha * t(inds));
% figure; plot(s(1:100));
spectrum(Fs,t,s);
%% 
A = 2;
T = 40; 
% Прямоугольный видеоимпульс
Fs =   500;
t = -50 : 1/Fs: 50;
s = zeros (size (t));
s(find(abs(t) <= T/2)) = A;
%s((t >= 0) & (t <= T)) = A;
%figure; plot(t,s);
spectrum(Fs,t,s);

%% 
% Несимметричный треугольный импульс
A = 2;
T = 20;
Fs =   200;
t = -20 : 1/Fs: 25
s = zeros (size (t));
inds = find((t >= 0) & (t <= T));
s(inds) = A * t(inds)/T;
 %figure; plot(s);
spectrum(Fs,t,s);
%% Генерация одиночных импульсов
%% Прямоугольный импульс

Fs = 1e3;
t = -40e-3:1/Fs:40e-3;
A=5;
T = 20e-3;
s = -A*rectpuls ( t+T/2, T) + A * rectpuls ( t-T/2, T);
 %figure; plot(t,s);

ylim([-6 6]);
spectrum(Fs,t,s);
%% 
% % Треугольный импульс
Fs =  1e3;
t = -50e-3:1/Fs:50e-3;
A=10;
T1 = 20e-3;
T2 = 60e-3;
s = A*(T2*tripuls(t,T2) - T1*tripuls(t,T1))/(T2-T1);
 %figure; plot(t,s);
spectrum(Fs,t,s);
%% Радиоимпульс
Fs =   1e3;
t = -0.1 : 1/Fs : 0.1;
f0 = 10;
T = 1/f0;
s = rectpuls (t,T) .* cos(2*pi*f0*t);
f = -50:50;
sp = T/2 * (sinc((f-f0)*T) + sinc ((f + f0)*T));
%figure; plot(t,s)
ylim([-1.1 1.1])
%figure; plot(f, abs(sp))
spectrum(Fs,t,s);
%% 
%Гауссов радиоимпульс
Fs =   16e3;
t = -10e-3 : 1/Fs : 10e-3;
Fc = 4e3;
bw = 0.1;
bwr = -20;
s = gauspuls (t, Fc, bw, bwr);
Nfft = 2^nextpow2(length(s));
sp = fft(s, Nfft);
sp_dB = 20*log10(abs(sp));
f = (0:Nfft - 1) / Nfft*Fs;
spectrum(Fs,t,s);
%figure; plot(t,s)

%figure, plot(f(1:Nfft/2),sp_dB(1:Nfft/2))

sp_max_db = 20*log10(max(abs(sp)));
edges = Fc * [1-bw/2 1+bw/2];
hold on
%plot(edges, sp_max_db([1 1])+bwr, 'o');
hold off
% 
%% Генерация последовательности импульсов 
%% Треугольные импульсы

Fs =   1e3;
t = 0 : 1/Fs : 0.5;
tau = 20e-3;
d = [20 80 160 260 380]' * 1e-3;
d(:,2) = 0.8.^(0:4)';
y = pulstran(t, d, 'tripuls', tau);
% figure; plot (t,y);
spectrum(Fs,t,y);
%% Последовательность импульсов

Fs0 = 400;
tau = 60e-3;
t0 = 0:1/Fs0:tau;
s0 = sin(pi*t0/tau).^2;
Fs =   1e3;
t = 0 : 1/Fs : 0.5;
d = (1:6)'*64e-3;
d(:,2) = 0.6.^(0:5)';
y = pulstran(t,d,s0,Fs0);
% figure; plot(t,y);
spectrum(Fs,t,y);
%% Генерация периодических сигналов
%% Последовательность прямоугольных импульсов

Fs =   1e3;
t = -10e-3 : 1/Fs : 50e-3;
A = 3;
f0 = 50;
tau = 5e-3;
s = (square(2*pi*t*f0, f0*tau*100) + 1) * A/2;
spectrum(Fs,t,s);
% figure; plot(t,s); ylim([0 5]);
%% Последовательность треугольных импульсов

Fs =   1e3;
t = -25e-3 : 1/Fs : 125e-3;
A = 5;
T = 50e-3;
t1 = 5e-3;
s = (sawtooth(2*pi*t/T, 1-t1/T)-1)*A/2;
% figure; plot(t,s); 
spectrum(Fs,t,s);
%% Функция Дирихле

t = 0:0.01:15;
s=diric(x,7)
spectrum(400,t,s);
%figure; plot(x,diric(x,7));
%grid on;
%title('n=7')
%figure; plot(x, diric(x,8));
%grid on;
%title('n = 8');

%% Генерация сигнала с меняющейся частотой
% 
% Fs =   8e3;
% t = 0 : 1/Fs : 1;
% f0 = 1e3;
% t1 = 1;
% f1 = 2e3;
% s1 = chirp(t,f0,t1,f1,'linear');
% s2 = chirp(t,f0,t1,f1,'quadratic');
% s3 = chirp(t,f0,t1,f1,'logarithmic');
% specgram (s1, [] , Fs);
% title('linear')
% colormap gray
% figure
% specgram (s2, [] , Fs);
% title('quadratic');
% colormap gray
% figure
% specgram (s3, [] , Fs);
% title('logarithmic');
% colormap gray
