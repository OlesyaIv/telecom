Fs = 1e3;
t = -50e-3:1/Fs:50e-3;
A = 10;
T1 = 20e-3;
T2 = 60e-3;
s = A*(T2*tripuls(t,T2)-T1*tripuls(t,T1))/(T2-T1);
plot(t,s,'Color','r');