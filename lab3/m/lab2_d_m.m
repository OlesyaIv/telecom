Fs = 200;
t = -10:1/Fs:10;
%��������
%����
y=sinc(t);
%�������������
x=rectpuls(t/2);
% �������
y1=fft(y);
x1=fft(x);
%��������� ��������
z=y.*x;
%������� �������� ��������
s=conv(x,y);
%������� ����������
figure
hold on
plot(t,y,'b')
plot(t,x,'r')
hold off
%������ �� ������������
figure
plot(z,'b')
%������ ������� ����������
figure
plot(s)
