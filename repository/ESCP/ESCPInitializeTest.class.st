"
An ESCPInitializeTest is a test class for testing the behavior of ESCPInitialize
"
Class {
	#name : #ESCPInitializeTest,
	#superclass : #TestCase,
	#category : 'ESCP-Tests'
}

{ #category : #'tests-writing' }
ESCPInitializeTest >> testWriteBytesOn [
	| c |
	c := ESCPInitialize new.
	
	self assert: (ByteArray streamContents: [ :s | c writeBytesOn: s ]) equals: #[16r1B 16r40].
]
