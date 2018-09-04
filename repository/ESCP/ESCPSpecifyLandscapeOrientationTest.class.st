"
An ESCPSpecifyLandscapeOrientationTest is a test class for testing the behavior of ESCPSpecifyLandscapeOrientation
"
Class {
	#name : #ESCPSpecifyLandscapeOrientationTest,
	#superclass : #TestCase,
	#category : 'ESCP-Tests'
}

{ #category : #'tests-writing' }
ESCPSpecifyLandscapeOrientationTest >> testWriteBytesOn [
	| c |
	c := ESCPSpecifyLandscapeOrientation new
			yourself.
			
	self should: [ ByteArray streamContents: [ :s | c writeBytesOn: s ] ] raise: ESCPBadConfiguredCommand.
	
	c isLandscape: true.
	
	self assert: (ByteArray streamContents: [ :s | c writeBytesOn: s ]) equals: #[16r1B 16r69 16r4C 16r01].
	
	c isLandscape: false.
	
	self assert: (ByteArray streamContents: [ :s | c writeBytesOn: s ]) equals: #[16r1B 16r69 16r4C 16r00]
]
