Class {
	#name : #ESCPSpecifyAbsoluteHorizontalPosition,
	#superclass : #ESCPCommand,
	#instVars : [
		'horizontalPosition'
	],
	#category : 'ESCP'
}

{ #category : #accessing }
ESCPSpecifyAbsoluteHorizontalPosition >> horizontalPosition [
	^ horizontalPosition
]

{ #category : #accessing }
ESCPSpecifyAbsoluteHorizontalPosition >> horizontalPosition: anObject [
	horizontalPosition := anObject
]

{ #category : #writing }
ESCPSpecifyAbsoluteHorizontalPosition >> writeBytesOn: aBinaryStream [
	(self horizontalPosition isNil
		or: [ self horizontalPosition isInteger not
		or: [ (self horizontalPosition between: 0 and: 65535) not ] ])
		ifTrue: [ self commandIsBadConfigured: #horizontalPosition ].
	aBinaryStream
		<< self esc;
		<< $$ codePoint;
		<< (self horizontalPosition % 256);
		<< (self horizontalPosition // 256)
		
]
