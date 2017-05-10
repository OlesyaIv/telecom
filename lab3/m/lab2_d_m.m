Fs = 200;
t = -10:1/Fs:10;
%исходные
%синк
y=sinc(t);
%прямоугольник
x=rectpuls(t/2);
% спектры
y1=fft(y);
x1=fft(x);
%умножение сигналов
z=y.*x;
%свертка исходных сигналов
s=conv(x,y);
%графики исходников
figure
hold on
plot(t,y,'b')
plot(t,x,'r')
hold off
%график их перемножения
figure
plot(z,'b')
%график свертки исходников
figure
plot(s)
