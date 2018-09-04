"
An ESCPSpecifyCharacterSizeTest is a test class for testing the behavior of ESCPSpecifyCharacterSize
"
Class {
	#name : #ESCPSpecifyCharacterSizeTest,
	#superclass : #TestCase,
	#category : 'ESCP-Tests'
}

{ #category : #'tests-writing' }
ESCPSpecifyCharacterSizeTest >> testWriteBytesOn [
	| c |
	c := ESCPSpecifyCharacterSize new
			yourself.
			
	self should: [ ByteArray streamContents: [ :s | c writeBytesOn: s ] ] raise: ESCPBadConfiguredCommand.
	
	c characterSize: 50.
	
	self assert: (ByteArray streamContents: [ :s | c writeBytesOn: s ]) equals: #[16r1B 16r58 16r00 16r32 16r00].
]
