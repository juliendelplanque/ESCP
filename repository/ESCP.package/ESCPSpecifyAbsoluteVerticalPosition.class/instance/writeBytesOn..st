writing
writeBytesOn: aBinaryStream
	(self verticalPosition isNil
		or: [ self verticalPosition isInteger not
		or: [ (self verticalPosition between: 0 and: 32767) not ] ])
		ifTrue: [ self commandIsBadConfigured: #verticalPosition ].
	aBinaryStream
		<< self esc;
		<< $( codePoint;
		<< $V codePoint;
		<< 16r02;
		<< 16r00;
		<< (self verticalPosition % 256);
		<< (self verticalPosition // 256)
		