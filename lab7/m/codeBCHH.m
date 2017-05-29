msg = [1 0 0 0]
code_msg = comm.BCHEncoder(7,4) 
	decode_msg = comm.BCHDecoder(7,4) 
	temp = msg'; % transpose
	code = step (code_msg , temp(:))' 
	code(2) = ~ code(4) % some error
	decode = step (decode_msg , code')'