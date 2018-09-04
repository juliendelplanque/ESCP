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
		<< self esc;
		<< $i codePoint;
		<< $L codePoint.
	self isLandscape
		ifTrue: [ aBinaryStream << 1 ]
		ifFalse: [ aBinaryStream << 0 ]
		
]
