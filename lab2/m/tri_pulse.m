clear all; close all; clc;

fs = 500; % ������� �������������
T = 0.1; % ������ ������������ ��������
t = -0.5:1/fs:0.5; % ������� �������
A = 2; % ���������
% ��������� T �� 2, ����� �������� ������������ ��������
x = A*tripuls(t, 2*T); % ��������� ��������

L=length(x);
NFFT = 500; % ���������� ����� ����� �������
% FFT ������ � FFTshift ��� ������������� � �����. ������
X = fftshift(fft(x,NFFT));
f = fs*(-NFFT/2:NFFT/2-1)/NFFT; % ������ ������

p = figure('position', [0, 0, 570, 500]);
fig1 = subplot(3, 1, 1);
plot(t, x, 'k');
title(['Triangular Pulse width=', num2str(2*T),'s']);
xlabel('Time(s)');
ylabel('Amplitude');

fig2 = subplot(3, 1, 2);
plot(f,abs(X)/(L), 'r');
title('Magnitude of FFT');
xlabel('Frequency (Hz)')
ylabel('Magnitude |X(f)|');

grid on;
fig3 = subplot(3, 1, 3);
plot(f, atan2(imag(X),real(X))*180/pi);
title('Phase spectrum');
xlabel('f (Hz)');
ylabel('?^X(k)');

grid on;
ylim(fig1, [-0.01 2.5]);
ylim(fig2, [0 0.25]);
xlim(fig2, [-30 30]);
xlim(fig3, [-50 50]);
