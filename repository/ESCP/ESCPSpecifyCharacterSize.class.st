Class {
	#name : #ESCPSpecifyCharacterSize,
	#superclass : #ESCPCommand,
	#instVars : [
		'characterSize'
	],
	#category : 'ESCP'
}

{ #category : #accessing }
ESCPSpecifyCharacterSize >> availableValues [
	^ #(24 32 33 38 42 46 48 50 58 67 75 83 92 100 117 133 150 167 200 233 267 300 333 367 400)
]

{ #category : #accessing }
ESCPSpecifyCharacterSize >> characterSize [
	^ characterSize
]

{ #category : #accessing }
ESCPSpecifyCharacterSize >> characterSize: anObject [
	characterSize := anObject
]

{ #category : #writing }
ESCPSpecifyCharacterSize >> writeBytesOn: aBinaryStream [
	(self characterSize isNil 
		or: [ self characterSize isInteger not
		or: [ (self availableValues includes: self characterSize) not ] ])
		ifTrue: [ self commandIsBadConfigured: #characterSize ]..
	aBinaryStream
		<< self esc;
		<< $X codePoint;
		<< 16r00;
		<< (self characterSize % 256);
		<< (self characterSize // 256)
]
