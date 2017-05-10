%% ������� ��� ���������� ������������ � �������� ��������
% f - ������� �������������
% t - ��������� ���
% s - �������� �������
function [] = spectrum (f,t,s)
L = length(s); % ���������� ����� �� ��������� �������
nfft=2^nextpow2(length(s)); %  ���������� ����� � ��������� �������
spec = fft(s)/L; % ����������� ������
%spec = fft(s,nfft);
spec = fftshift(spec); % ������������ ������� ������������ ����
a_spec = abs(spec); % ������ ������������ �������
f_spec = angle(spec);% ���� ������������ �������

%freq = f/nfft*(-(nfft-1)/2:(nfft-1)/2);
freq = f/2*linspace(-1, 1, nfft); % ������ ������, ��
freq =-(f/2-1/L):f/L:f/2-1/L;% ������ ������
%freq=(0:nfft-1)/nfft*f;
%% ���������� ��������

% ���������� ��������������� ����
eps = 10e-3;
threshold = max(abs(spec))*eps;
Im = imag(spec);
spec(abs(spec) < threshold) = 0;
Im(abs(Im) < threshold) = 0;
f_spec = atan2(Im,real(spec))*180/pi;% ���� �

figure;
set(0,'DefaultAxesFontSize',14,'DefaultAxesFontName','Arial');
set(0,'DefaultTextFontSize',20,'DefaultTextFontName','Times New Roman'); 
%subplot(3,1,1);% ����� ������� ���� ��� ����������
plot(t,s,'linewidth', 1.5);% ���������� �������
title('Signal');% ������� �������
xlabel('t, s');% ������� ��� � �������
%ylabel('���������');% ������� ��� � �������
%xlim([0 0.2]);
%ylim([-3 3]);
grid on;
figure;

subplot(2,1,1);% ����� ������� ���� ��� ����������
plot(freq,a_spec,'r','linewidth', 1);% ���������� �������
title('Magnitude');% ������� �������
xlabel('f, Hz');% ������� ��� � �������
%ylabel('���������');% ������� ��� � �������
%xlim([-100 100])
%ylim([-0.5 1.5])
grid on;

subplot(2,1,2);% ����� ������� ���� ��� ����������
plot(freq,f_spec,'r','linewidth', 1);% ���������� ����� ������+���
title('Phaze');% ������� �������
xlabel('f, Hz');% ������� ��� � �������
%ylabel('����');% ������� ��� � �������%xlim([-3 3])
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