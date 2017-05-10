Fs = 1e3;              % ������� �������������
t = -10e-3:1/Fs:50e-3; % ���������� �����
A = 3;                 % ���������
f0 = 50;               % ������� ���������� ���������
tau = 5e-3;            % ������������ ���������
s = (square(2*pi*t*f0, f0*tau*100)+1)*A/2;
plot(t,s,'Color','r')
ylim([0 5])