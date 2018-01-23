writing
writeBytesOn: aBinaryStream
	self string isString
		ifFalse: [ self commandIsBadConfigured: #string ].
	aBinaryStream
		<< self string asByteArray