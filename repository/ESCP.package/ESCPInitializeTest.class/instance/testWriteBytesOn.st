tests-writing
testWriteBytesOn
	| c |
	c := ESCPInitialize new.
	
	self assert: (ByteArray streamContents: [ :s | c writeBytesOn: s ]) equals: #[16r1B 16r40].