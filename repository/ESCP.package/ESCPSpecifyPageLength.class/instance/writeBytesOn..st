writing
writeBytesOn: aBinaryStream
	(self pageLength isNil
		or: [ self pageLength isInteger not
		or: [( self pageLength between: 0 and: 12000) not ] ])
		ifTrue: [ self commandIsBadConfigured: #pageLength ].
	aBinaryStream
		<< self esc;
		<< $( codePoint;
		<< $C codePoint;
		<< 2;
		<< 0;
		<< (self pageLength % 256);
		<< (self pageLength // 256).
	
		