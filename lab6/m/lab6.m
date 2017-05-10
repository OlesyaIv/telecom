% M = 2;
% s = randint(1, 1000, [0 M-1]); % цифровое сообщение
% ph = -pi/16;
% bpsk = pskmod(s, M, ph); % модулирование
% h = scatterplot(bpsk, 1, 0, 'o'); % вывод созвездия
% grid on; hold on;
% bpsk_err = bpsk+randerr(1,1000,100); % сигнал с ошибками
% scatterplot(bpsk_err, 1, 0,'r.', h);
% title('BPSK');
% hold off;
% msg = pskdemod(bpsk_err, M, ph);
% [Num,Rat] = symerr(s, msg)
% 
% M = 8;
% s = randint(1000, 1, [0 M-1]); % цифровое сообщение
% ph = pi/4;
% psk = pskmod(s, M, ph); % модулирование
% h = scatterplot(psk, 1, 0, 'o'); % вывод созвездия
% grid on;
% hold on;
% err = randerr(1, 1000, 100)'; % вектор ошибок, 100шт
% psk_err = psk+err; % мод. сигнал с ошибками
% scatterplot(psk_err, 1, 0, 'r.', h);
% title('8-PSK');
% hold off;
% msg = pskdemod(psk_err, M, ph);
% [Num,Rat] = symerr(s, msg)
% 
% M = 4;
% s = randint(1000, 1, [0 M-1]); % цифровое сообщение
% ph = -pi/8;
% oqpsk = oqpskmod(s, ph); % модулирование
% h = scatterplot(oqpsk, 2, 1, 'o'); % вывод созвездия
% grid on;
% hold on;
% err = randerr(1, 2*1000, 2*100)'; % вектор ошибок, 200шт
% oqpsk_err = oqpsk+[err; 0]; % мод. сигнал с ошибками
% scatterplot(oqpsk_err, 2, 1, 'r.', h);
% title('OQPSK');
% hold off;
% msg = oqpskdemod(oqpsk_err, ph);
% [Num,Rat] = symerr(s, msg)

c = [6i 6i+2 5i+2 4i+2 3i+2 2i+2 2i+3.5 2i+5 3.8 -2i+2.6 -4i+1.4 -6i -4i-1.4 -2i-2.6 -3.8 2i-5 2i-3.5 2i-2 3i-2 4i-2 5i-2 6i-2];
M = length(c); % 16

s = randint(1000, 1, [0 M-1]);
modData = genqammod(s, c);
h = scatterplot(modData, 1, 0, 'o');
grid on;
hold on;
rxSig = modData + randerr(1, 1000, 100)';
scatterplot(rxSig, 1, 0, 'r.', h);
title('QAM');
hold off;
z = genqamdemod(rxSig, c);
[Num,Rat] = symerr(s, z)

% s = randint(1000, 1, [0 1]);
% ph = pi/2;
% msk = mskmod(s, 8, [], ph);
% h = scatterplot(msk, 8, 0, 'o'); % вывод созвездия
% grid on;
% hold on;
% msk_err = msk-randerr(1, 8*1000, 8*100)'; % мод. сигнал с ошибками
% scatterplot(msk_err, 8, 0, 'r.', h);
% title('MSK');
% hold off;
% msg = mskdemod(msk_err, 8, [], ph);
% [Num,Rat] = symerr(s, msg)
% 

