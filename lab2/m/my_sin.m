clear all; close all; clc

f = 10; % частота гарм. сигнала
Fs = 100; % частота дискретизации
Ph = pi/4; % фазовый сдвиг (рад)
nCyl = 5; % чтобы сгенерировать 5 периодов
A = 1.5; % амплитуда
 
t = 0:1/Fs:nCyl*1/f; % дискр. отсчеты времени

x = A*sin(2*pi*f*t + Ph); % синтез сигнала

NFFT = 550;	% % число линий Фурье спектра
X = fftshift(fft(x,NFFT)); % получаем спектр
fVals = Fs*(-NFFT/2:NFFT/2-1)/NFFT;	% вектор частот	 

p = figure('position', [0, 0, 570, 500]);
fig1 = subplot(3,1,1);
plot(t, x, 'k');
title(['Sine Wave f=', num2str(f), 'Hz']);
xlabel('Time(s)');
ylabel('Amplitude');

fig2 = subplot(3,1,2);
plot(fVals, abs(X)/length(x), 'r');	 	 
title('Double Sided FFT - with FFTShift');	 	 
xlabel('Frequency (Hz)')	 	 
ylabel('|DFT Values|');
grid on;

fig3 = subplot(3,1,3);
plot(fVals, atan2(imag(X),real(X))*180/pi);
title('Phase spectrum');
xlabel('f (Hz)');
ylabel('∠X(k)');
grid on;

ylim(fig1, [-1.55 1.55]);
