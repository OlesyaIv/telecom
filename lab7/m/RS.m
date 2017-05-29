

msg = [1 0 0 0]
code_msg = comm.BCHEncoder(7,4) 
	decode_msg = comm.BCHDecoder(7,4) 
	temp = msg'; % transpose
	code = step (code_msg , temp(:))' 
	code(2) = ~ code(4) % some error
	decode = step (decode_msg , code')'


fprintf('RS code');
code_rs = comm.RSEncoder(6,4);
dec_rs = comm.RSDecoder(6,4);
temp = message'
code = step(code_rs, temp(:))'
decode = step(dec_rs, code')'