Class {
	#name : #ESCPSelectFont,
	#superclass : #ESCPCommand,
	#instVars : [
		'fontNumber'
	],
	#category : 'ESCP'
}

{ #category : #accessing }
ESCPSelectFont >> fontNumber [
	^ fontNumber
]

{ #category : #accessing }
ESCPSelectFont >> fontNumber: anObject [
	fontNumber := anObject
]

{ #category : #writing }
ESCPSelectFont >> writeBytesOn: aBinaryStream [
	(self fontNumber isNil
		or: [ self fontNumber isInteger not
		or: [ (self fontNumber between: 0 and: 4) not 
					and: [ (self fontNumber between: 9 and: 11) not ] ] ])
		ifTrue: [ self commandIsBadConfigured: #fontNumber ].
	aBinaryStream
		<< self esc;
		<< $k codePoint;
		<< self fontNumber
		
]
