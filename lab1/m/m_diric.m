x = 0:0.01:15;
subplot(2,1,1);
plot(x, diric(x, 7),'Color','r');
grid on;
title('n = 7');
subplot(2,1,2);
plot(x, diric(x, 8),'Color','r');
grid on;
title('n = 8');