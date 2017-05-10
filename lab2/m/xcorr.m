close all; clear all; clc;
% 0 0 0 1 0 1 0 1 1 1 0 0 0 0 1 0

r = [0 0 0 1 0 1 0 1 1 1 0 0 0 0 1 0]; % сигнал
m = [1 0 1]; % синхропосылка (шаблон)
scale = 100; % во сколько "растянуть" сигналы
% e.g. для [1 0], scale=2: [1 1 0 0];
r = bld_signal(r, scale);
m = bld_signal(m, scale);
% пусть частота дискретизации соответствует числу отсчетов
Fs = (numel(r)-1);

% выводим графики исходных сигналов в одном масштабе
p = figure('position', [850, 450, 583, 500]);
ax(1) = subplot(311);
plot((0:numel(m)-1)/Fs, m, 'm');
ylabel('Template');
grid on;
ax(2) = subplot(312);
plot((0:numel(r)-1)/Fs, r, 'r');
ylabel('Signal');
grid on;
xlabel('Time (secs)');
linkaxes(ax(1:2), 'xy'); % связываем оси по X и Y
axis([-0.05 1.05 -0.05 1.05]);

tic;
[C, lag] = xcorr(m, r); % вычисление корреляции
toc

% выводим график корреляции
ax(3) = subplot(313);
plot(lag/Fs, C, 'b');
ylabel('Amplitude');
grid on
title('Cross-correlation between Template and Signal');
axis([-1.05 1.05 -10 210]); % корреляция мб отрицательной по Y

Z = max(abs(C)); % поиск наибольшего коэффициента
I = find(abs(C-Z) < Z*0.05, 1, 'last');
SampleDiff = lag(I) % выводим значение задержки
timediff = SampleDiff/Fs % переводим в единицы времени

if(SampleDiff == 0) SampleDiff = 1; end; % r(0:end) - нельзя
r_al = r(abs(SampleDiff):end); % выравнивание сигнала

% выводим график выравненного сигнала и график синхропосылки
figure('position', [850, 0, 583, 333]);
ax(4) = subplot(211);
plot((0:numel(m)-1)/Fs, m, 'm');
ylabel('Template');
grid on;
ax(5) = subplot(212);
plot((0:length(r_al)-1)/Fs, r_al, 'r');
ylabel('Signal, aligned');
xlabel('Time (s)');
grid on;
linkaxes(ax(4:5), 'xy');
axis([-0.05 1.05 -0.05 1.05]);

% определение посылки
lm = 8; % длина пакета данных
p = zeros(1, lm); % выделение памяти под пакет с данными
for i=0:lm-1
  % смотрим значение сигнала в середине импульса
  p(i+1) = r_al(350+i*scale); % пропускаем 3 имп. синхропосылки
end
p % выводим