writing
writeBytesOn: aBinaryStream
	(self characterSize isNil 
		or: [ self characterSize isInteger not
		or: [ (self availableValues includes: self characterSize) not ] ])
		ifTrue: [ self commandIsBadConfigured: #characterSize ]..
	aBinaryStream
		<< self esc;
		<< $X codePoint;
		<< 16r00;
		<< (self characterSize % 256);
		<< (self characterSize // 256)