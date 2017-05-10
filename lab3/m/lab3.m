clear all;
close all;

Fs =   4000; %% Частота дискретизации
t = 0 : 1/Fs: 0.5; %% Ось времени
F = 10;
A = 2; %% Амплитуда
s = A * sin(2*pi*F*t);

set(0,'DefaultAxesFontSize',12,'DefaultAxesFontName','Arial');
set(0,'DefaultTextFontSize',12,'DefaultTextFontName','Arial'); 
%plot(t,s,'linewidth', 1.5)

%% добавление шума
y = awgn(s,10);
%plot(t,y,'r')
% hold on; plot(t,y,'linewidth', 1)
spectrum(Fs,t,s);
spectrum(Fs,t,y);
nfft=2^nextpow2(length(y));
%% Фильтр

% All frequency values are in Hz.
Fs = 4500;  % Sampling Frequency
Fpass = 20;              % Passband Frequency
Fstop = 100;              % Stopband Frequency
Dpass = 0.057501127785;   % Passband Ripple
Dstop = 0.0031622776602;  % Stopband Attenuation
flag  = 'scale';          % Sampling Flag

% Calculate the order from the parameters using KAISERORD.
[N,Wn,BETA,TYPE] = kaiserord([Fpass Fstop]/(Fs/2), [1 0], [Dstop Dpass]);

% Calculate the coefficients using the FIR1 function.
b  = fir1(N, Wn, TYPE, kaiser(N+1, BETA), flag);
Hd = dfilt.dffir(b);

%% [EOF]
yy=filter(b,1,y)
figure; plot(yy,'linewidth', 1.5);
grid on;
spectrum(Fs,t,yy);
yy=conv(y,b)
%figure; plot(yy,'linewidth', 1.5);
grid on;