tests-writing
testWriteBytesOn
	| c |
	c := ESCPSelectFont new
			yourself.
			
	self should: [ ByteArray streamContents: [ :s | c writeBytesOn: s ] ] raise: ESCPBadConfiguredCommand.
	
	c fontNumber: 11.
	
	self assert: (ByteArray streamContents: [ :s | c writeBytesOn: s ]) equals: #[16r1B 16r6B 16r0B].