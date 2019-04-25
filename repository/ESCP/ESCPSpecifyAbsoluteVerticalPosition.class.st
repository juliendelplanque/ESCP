Class {
	#name : #ESCPSpecifyAbsoluteVerticalPosition,
	#superclass : #ESCPCommand,
	#instVars : [
		'verticalPosition'
	],
	#category : 'ESCP'
}

{ #category : #accessing }
ESCPSpecifyAbsoluteVerticalPosition >> verticalPosition [
	^ verticalPosition
]

{ #category : #accessing }
ESCPSpecifyAbsoluteVerticalPosition >> verticalPosition: anObject [
	verticalPosition := anObject
]

{ #category : #writing }
ESCPSpecifyAbsoluteVerticalPosition >> writeBytesOn: aBinaryStream [
	(self verticalPosition isNil
		or: [ self verticalPosition isInteger not
		or: [ (self verticalPosition between: 0 and: 32767) not ] ])
		ifTrue: [ self commandIsBadConfigured: #verticalPosition ].
	aBinaryStream
		nextPut: self esc;
		nextPut: $( codePoint;
		nextPut: $V codePoint;
		nextPut: 16r02;
		nextPut: 16r00;
		nextPut: (self verticalPosition % 256);
		nextPut: (self verticalPosition // 256)
		
]
