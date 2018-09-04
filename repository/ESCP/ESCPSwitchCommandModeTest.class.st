"
An ESCPSwitchCommandModeTest is a test class for testing the behavior of ESCPSwitchCommandMode
"
Class {
	#name : #ESCPSwitchCommandModeTest,
	#superclass : #TestCase,
	#category : 'ESCP-Tests'
}

{ #category : #'tests-writing' }
ESCPSwitchCommandModeTest >> testWriteBytesOn [
	| c |
	c := ESCPSwitchCommandMode new
			yourself.
			
	self should: [ ByteArray streamContents: [ :s | c writeBytesOn: s ] ] raise: ESCPBadConfiguredCommand.
	
	c commandMode: 16r00.
	self assert: (ByteArray streamContents: [ :s | c writeBytesOn: s ]) equals: #[16r1B 16r69 16r61 16r00].
	
	c commandMode: 16r01.
	self assert: (ByteArray streamContents: [ :s | c writeBytesOn: s ]) equals: #[16r1B 16r69 16r61 16r01].
	
	c commandMode: 16r03.
	self assert: (ByteArray streamContents: [ :s | c writeBytesOn: s ]) equals: #[16r1B 16r69 16r61 16r03].
]
