%% Функция для построения амплитудного и фазового спектров
% f - частота дискретизации
% t - временная ось
% s - значения сигнала
function [] = spectrum (f,t,s)
L = length(s); % количество точек во временной области
nfft=2^nextpow2(length(s)); %  количество точек в частотной области
spec = fft(s)/L; % комплексный спектр
%spec = fft(s,nfft);
spec = fftshift(spec); % Выравнивание спектра относительно нуля
a_spec = abs(spec); % модуль комплексного спектра
f_spec = angle(spec);% фаза комплексного спектра

%freq = f/nfft*(-(nfft-1)/2:(nfft-1)/2);
freq = f/2*linspace(-1, 1, nfft); % вектор частот, Гц
freq =-(f/2-1/L):f/L:f/2-1/L;% Массив частот
%freq=(0:nfft-1)/nfft*f;
%% Построение графиков

% Устранение вычислительного шума
eps = 10e-3;
threshold = max(abs(spec))*eps;
Im = imag(spec);
spec(abs(spec) < threshold) = 0;
Im(abs(Im) < threshold) = 0;
f_spec = atan2(Im,real(spec))*180/pi;% фаза к

figure;
set(0,'DefaultAxesFontSize',14,'DefaultAxesFontName','Arial');
set(0,'DefaultTextFontSize',20,'DefaultTextFontName','Times New Roman'); 
%subplot(3,1,1);% Выбор области окна для построения
plot(t,s,'linewidth', 1.5);% Построение сигнала
title('Signal');% Подпись графика
xlabel('t, s');% Подпись оси х графика
%ylabel('Амплитуда');% Подпись оси у графика
%xlim([0 0.2]);
%ylim([-3 3]);
grid on;
figure;

subplot(2,1,1);% Выбор области окна для построения
plot(freq,a_spec,'r','linewidth', 1);% Построение сигнала
title('Magnitude');% Подпись графика
xlabel('f, Hz');% Подпись оси х графика
%ylabel('Амплитуда');% Подпись оси у графика
%xlim([-100 100])
%ylim([-0.5 1.5])
grid on;

subplot(2,1,2);% Выбор области окна для построения
plot(freq,f_spec,'r','linewidth', 1);% Построение смеси сигнал+шум
title('Phaze');% Подпись графика
xlabel('f, Hz');% Подпись оси х графика
%ylabel('Фаза');% Подпись оси у графика%xlim([-3 3])
%xlim([-100 100])
grid on;

% fftL = 2^nextpow2(length(t));
% F=(0:fftL-1) /fftL * Fs ;
% spec = fft(signal,fftL);
% amp_spc=abs ( spec ) ;
% r=real ( spec ) ;
% im=imag( spec ) ;
% phs_spc=atan ( im./r ) ;
end