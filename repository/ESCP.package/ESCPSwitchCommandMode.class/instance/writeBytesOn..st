writing
writeBytesOn: aBinaryStream
	(self commandMode isNotNil and: [ self commandMode isInteger ])
		ifFalse: [ self commandIsBadConfigured: #commandMode ].
	aBinaryStream
		<< self esc;
		<< $i codePoint;
		<< $a codePoint;
		<< self commandMode
		