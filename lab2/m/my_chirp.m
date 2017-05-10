fs = 500; % частота дискретизации
t = 0:1/fs:1; % отсчеты времени
 
f0 = 1; % начальная частота chirp
f1 = 25; % частота chirp при t = 1 (в конце)
x = chirp(t, f0, 1, f1); 

L = length(x);
NFFT = 1024;
X = fftshift(fft(x, NFFT));
f = fs*(-NFFT/2:NFFT/2-1)/NFFT; % вектор частот

p = figure('position', [0, 0, 570, 500]);
fig1 = subplot(3,1,1)
plot(t, x, 'k');
title(['Chirp Signal']);
xlabel('Time(s)');
ylabel('Amplitude');

fig2 = subplot(3,1,2)
plot(f,abs(X)/(L), 'r');
title('Magnitude of FFT');
xlabel('Frequency (Hz)')
ylabel('Magnitude |X(f)|');
grid on;

fig3 = subplot(3, 1, 3);
plot(f, atan2(imag(X),real(X))*180/pi);
title('Phase spectrum');
xlabel('f (Hz)');
ylabel('∠X(k)');
grid on;

ylim(fig1, [-1.05 1.05]);
ylim(fig2, [0 0.14]);
xlim(fig2, [-50 50]);
xlim(fig3, [-50 50]);
