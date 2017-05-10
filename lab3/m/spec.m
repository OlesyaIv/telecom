%% ������� ��� ���������� ������������ � �������� ��������
% f - ������� �������������
% t - ��������� ���
% s - �������� �������
function [] = spectrum (f,t,s)
L = length(s); % ���������� ����� �� ��������� �������
nfft=2^nextpow2(length(s)); %  ���������� ����� � ��������� �������
spec = fft(s,nfft)/nfft; % ����������� ������
spec = fftshift(spec); % ������������ ������� ������������ ����
a_spec = abs(spec); % ������ ������������ �������
f_spec = angle(spec);% ���� ������������ �������

%freq = f/nfft*(-(nfft-1)/2:(nfft-1)/2);
freq = f/2*linspace(-1, 1, nfft); % ������ ������, ��
%% ���������� ��������
figure;

set(0,'DefaultAxesFontSize',14,'DefaultAxesFontName','Arial');
set(0,'DefaultTextFontSize',20,'DefaultTextFontName','Times New Roman'); 
%subplot(3,1,1);% ����� ������� ���� ��� ����������
plot(t,s);% ���������� �������
title('Signal');% ������� �������
xlabel('t, s');% ������� ��� � �������
%ylabel('���������');% ������� ��� � �������
%xlim([-25 30])
%ylim([0 3])
grid on;
figure;
subplot(2,1,1);% ����� ������� ���� ��� ����������
plot(freq,a_spec,'r');% ���������� �������
title('Magnitude');% ������� �������
xlabel('f, Hz');% ������� ��� � �������
%ylabel('���������');% ������� ��� � �������
%xlim([-3 3])
grid on;

subplot(2,1,2);% ����� ������� ���� ��� ����������
plot(freq,f_spec,'r');% ���������� ����� ������+���
title('Phaze');% ������� �������
xlabel('f, ��');% ������� ��� � �������
%ylabel('����');% ������� ��� � �������%xlim([-3 3])
%xlim([-3 3])
grid on;

% fftL = 2^nextpow2(length(t));
% F=(0:fftL-1) /fftL * Fs ;
% spec = fft(signal,fftL);
% amp_spc=abs ( spec ) ;
% r=real ( spec ) ;
% im=imag( spec ) ;
% phs_spc=atan ( im./r ) ;
end