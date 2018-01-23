writing
writeBytesOn: aBinaryStream
	aBinaryStream
		<< self esc;
		<< 16r45