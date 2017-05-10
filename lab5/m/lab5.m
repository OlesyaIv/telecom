 clear all;
close all;
Fs =   4000; %% Частота дискретизации
Fc = 100;%%частота несущая
t = 0 : 1/Fs: 0.1; %% Ось времени
A = 2; %% Амплитуда
F = 30;
s = A * sin(2*F*pi*t);
spectrum(Fs,t,s);
%% phaze
x = pmmod(s,Fc,Fs,1);
spectrum(Fs,t,x);
xd = pmdemod(x,Fc,Fs,1);
spectrum(Fs,t,xd);
%% freq
y = fmmod(s,Fc,Fs,15);
spectrum(Fs,t,y);
dy =  fmdemod(y,Fc,Fs,15);
spectrum(Fs,t,dy);
 %% balansn
% k = 0;
% f = ammod(s,Fc,Fs,0);
% spectrum(Fs,t,f);
% %% ssbmod-odnopolosnaya
% z=ssbmod(s,Fc,Fs,0,'upper');
% spectrum(Fs,t,z);
% %% demodul
% q = z.*sin(2*pi*Fc*t);
% spectrum(Fs,t,q);
% [b,a]=butter(5,Fc/Fs*2);
% %% filter
% q_filt= filtfilt(b,a,q);
% spectrum(Fs,t,q_filt);