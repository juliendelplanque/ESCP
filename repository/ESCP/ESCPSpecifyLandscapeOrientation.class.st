Class {
	#name : #ESCPSpecifyLandscapeOrientation,
	#superclass : #ESCPCommand,
	#instVars : [
		'isLandscape'
	],
	#category : 'ESCP'
}

{ #category : #accessing }
ESCPSpecifyLandscapeOrientation >> isLandscape [
	^ isLandscape
]

{ #category : #accessing }
ESCPSpecifyLandscapeOrientation >> isLandscape: anObject [
	isLandscape := anObject
]

{ #category : #writing }
ESCPSpecifyLandscapeOrientation >> writeBytesOn: aBinaryStream [
	self isLandscape ifNil: [ self commandIsBadConfigured: #isLandscape ].
	aBinaryStream
		nextPut: self esc;
		nextPut: $i codePoint;
		nextPut: $L codePoint.
	self isLandscape
		ifTrue: [ aBinaryStream nextPut: 1 ]
		ifFalse: [ aBinaryStream nextPut: 0 ]
		
]
