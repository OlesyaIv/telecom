 clear all;
close all;
Fs =   2000; %% Частота дискретизации
Fc = 20;%%частота несущая
t = 0 : 1/Fs: 2; %% Ось времени
A = 2; %% Амплитуда
F = 1;
k = 2;
s = k + A * sin(2*F*pi*t);%%F=1Hz
m = A/k;
n1 = (m^2/(m^2+2))*100
%s= (1 + Ainf)*cos(t)*Anes*cos(t));
%spectrum(Fs,t,s);
%% amplit
x=ammod(s,Fc,Fs);
%spectrum(Fs,t,x);
%% podavl
y=ammod(s,Fc,Fs);
spectrum(Fs,t,y);
%% balansn
k = 0;
f = ammod(s,Fc,Fs,0);
%spectrum(Fs,t,f);
%% ssbmod-odnopolosnaya
z=ssbmod(s,Fc,Fs,0,'upper');
%spectrum(Fs,t,z);
%% demodul
q = z.*sin(2*pi*Fc*t);
%spectrum(Fs,t,q);
[b,a]=butter(5,Fc/Fs*2);
%% filter
q_filt= filtfilt(b,a,q);
%spectrum(Fs,t,q_filt);