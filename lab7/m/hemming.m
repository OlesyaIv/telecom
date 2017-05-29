%By Hamming
msg = [1 0 0 0]  %signal
m=3; n = 2^m-1; k = n-m;
code = encode(msg,n,k,'hamming/ binary ') %coding
decoding = decode(code,n,k,'hamming/ binary ') %decoding
%By matrix
[parmat,g,n,k] = hammgen(m); % matrix.
trt = syndtable(parmat); % table.
recd = [1 1 0 1 0 0 0] % Suppose this is the received vector.
%recd = msg*g % Suppose this is the received vector.
recd(1)=0; % some error
syndrome = rem(recd * parmat',2);
syndrome_de = bi2de(syndrome,'left-msb');
disp(['Syndrome = ',num2str(syndrome_de),...
      ' (decimal), ',num2str(syndrome),' (binary)'])
corrvect = trt(1+syndrome_de,:) % Correction vector
correctedcode = rem(corrvect+recd,2)
decoding = decode(correctedcode,n,k,'hamming/binary') %decoding