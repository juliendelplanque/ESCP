"
An ESCPSpecifyAbsoluteHorizontalPositionTest is a test class for testing the behavior of ESCPSpecifyAbsoluteHorizontalPosition
"
Class {
	#name : #ESCPSpecifyAbsoluteHorizontalPositionTest,
	#superclass : #TestCase,
	#category : 'ESCP-Tests'
}

{ #category : #'tests-writing' }
ESCPSpecifyAbsoluteHorizontalPositionTest >> testWriteBytesOn [
	| c |
	c := ESCPSpecifyAbsoluteHorizontalPosition new
			yourself.
			
	self should: [ ByteArray streamContents: [ :s | c writeBytesOn: s ] ] raise: ESCPBadConfiguredCommand.
	
	c horizontalPosition: 150.
	
	self assert: (ByteArray streamContents: [ :s | c writeBytesOn: s ]) equals: #[16r1B 16r24 16r96 16r00].
]
