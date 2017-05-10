close all;

s = [ 0 0 0 1 0 1 0 1 1 1 0 0 0 0 1 0 ]';
m = [1 0 1]'; % �������������
tic()
k = xcorr(s,m);
toc()
coeff=k(16:31) % ������������ ���������� ����� �������� ��� � ��������������
L=8; % ����� ������������� ���������
% ��������� ���������
figure; plot(coeff,'k','linewidth', 1.5);
for i=1:length(s)
if (coeff(i)>=2)
  message=s(i+length(m) : i+length(m)+L-1);
  break;
end 
end 
message;

%% ������� ����������

% Fs=fft(s, 16)
% Fm=fft(m, 16)
% Cm = conj(Fm)
nfft = 16;
tic()
corr=ifft( fft(s,nfft) .* conj(fft(m,nfft)) ); % ������� � �������
toc()
figure;plot(corr,'k','linewidth', 1.5);

for i=1:length(s)
if (corr(i)>=2)
  message=s(i+length(m) : i+length(m)+L-1);
  break;
end 
end 
message