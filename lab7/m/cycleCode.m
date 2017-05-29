% Cycle code
message = [1 0 0 0];
clen=6;
mlen=4;
pol = cyclpoly(clen, mlen);
[h_cycle, g_cycle] = cyclgen(clen, pol);
codecycle = message*g_cycle;
codecycle = rem(codecycle, ones(1,clen).*2)
decode_message = [code(4), code(5), code(6), code(7)]
syndrome = rem(codecycle*h_cycle', ones(1,clen-mlen).*2)