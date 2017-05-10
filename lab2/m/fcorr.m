close all; clear all; clc;
% 0 0 0 1 0 1 0 1 1 1 0 0 0 0 1 0

r = [0 0 0 1 0 1 0 1 1 1 0 0 0 0 1 0]; % ������
m = [1 0 1]; % ������������� (������)
scale = 100; % �� ������� "���������" �������
% e.g. ��� [1 0], scale=2: [1 1 0 0];
r = bld_signal(r, scale);
m = bld_signal(m, scale);
% ����� ������� ������������� ������������� ����� ��������
Fs = (numel(r));

% ������� ������� �������� �������� � ����� ��������
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
linkaxes(ax(1:2), 'xy'); % ��������� ��� �� X � Y
axis([-0.05 1.05 -0.05 1.05]);

tic;
C = ifft(fft(fliplr(r), 2*Fs).*fft(fliplr(m), 2*Fs), 2*Fs);
lag = [-Fs:Fs-1]; 
toc

% ������� ������ ����������
ax(3) = subplot(313);
plot(lag/Fs, real(C), 'b');
ylabel('Amplitude');
grid on
title('Cross-correlation between Template and Signal');
axis([-1.05 1.05 -10 210]); % ���������� �� ������������� �� Y

Z = max(abs(C)); % ����� ����������� ������������
I = find(abs(C-Z) < Z*0.05, 1, 'last');
SampleDiff = lag(I) % ������� �������� ��������
timediff = SampleDiff/Fs % ��������� � ������� �������

if(SampleDiff == 0) SampleDiff = 1; end; % r(0:end) - ������
r_al = r(abs(SampleDiff):end); % ������������ �������

% ������� ������ ������������ ������� � ������ �������������
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

% ����������� �������
lm = 8; % ����� ������ ������
p = zeros(1, lm); % ��������� ������ ��� ����� � �������
for i=0:lm-1
  % ������� �������� ������� � �������� ��������
  p(i+1) = r_al(350+i*scale); % ���������� 3 ���. �������������
end
p % �������