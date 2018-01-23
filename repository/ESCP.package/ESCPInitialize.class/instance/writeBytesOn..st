writing
writeBytesOn: aBinaryStream
	aBinaryStream
		<< self esc;
		<< $@ codePoint