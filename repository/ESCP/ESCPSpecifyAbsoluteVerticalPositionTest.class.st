"
An ESCPSpecifyAbsoluteVerticalPositionTest is a test class for testing the behavior of ESCPSpecifyAbsoluteVerticalPosition
"
Class {
	#name : #ESCPSpecifyAbsoluteVerticalPositionTest,
	#superclass : #TestCase,
	#category : 'ESCP-Tests'
}

{ #category : #'tests-writing' }
ESCPSpecifyAbsoluteVerticalPositionTest >> testWriteBytesOn [
	| c |
	c := ESCPSpecifyAbsoluteVerticalPosition new
			yourself.
			
	self should: [ ByteArray streamContents: [ :s | c writeBytesOn: s ] ] raise: ESCPBadConfiguredCommand.
	
	c verticalPosition: 252.
	
	self assert: (ByteArray streamContents: [ :s | c writeBytesOn: s ]) equals: #[16r1B 16r28 16r56 16r02 16r00 16rFC 16r00].
]
