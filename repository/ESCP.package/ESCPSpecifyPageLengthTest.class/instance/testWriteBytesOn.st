tests-writing
testWriteBytesOn
	| c |
	c := ESCPSpecifyPageLength new
			yourself.
			
	self should: [ ByteArray streamContents: [ :s | c writeBytesOn: s ] ] raise: ESCPBadConfiguredCommand.
	
	c pageLength: 528.
	
	self assert: (ByteArray streamContents: [ :s | c writeBytesOn: s ]) equals: #[16r1B 16r28 16r43 16r02 16r00 16r10 16r02].