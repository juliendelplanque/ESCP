tests-writing
testWriteBytesOn
	| c |
	c := ESCPSpecifyAbsoluteHorizontalPosition new
			yourself.
			
	self should: [ ByteArray streamContents: [ :s | c writeBytesOn: s ] ] raise: ESCPBadConfiguredCommand.
	
	c horizontalPosition: 150.
	
	self assert: (ByteArray streamContents: [ :s | c writeBytesOn: s ]) equals: #[16r1B 16r24 16r96 16r00].