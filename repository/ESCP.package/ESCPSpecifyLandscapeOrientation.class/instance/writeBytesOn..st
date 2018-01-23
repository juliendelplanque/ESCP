writing
writeBytesOn: aBinaryStream
	self isLandscape ifNil: [ self commandIsBadConfigured: #isLandscape ].
	aBinaryStream
		<< self esc;
		<< $i codePoint;
		<< $L codePoint.
	self isLandscape
		ifTrue: [ aBinaryStream << 1 ]
		ifFalse: [ aBinaryStream << 0 ]
		