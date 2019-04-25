Class {
	#name : #ESCPSpecifyPageLength,
	#superclass : #ESCPCommand,
	#instVars : [
		'pageLength'
	],
	#category : 'ESCP'
}

{ #category : #accessing }
ESCPSpecifyPageLength >> pageLength [
	^ pageLength
]

{ #category : #accessing }
ESCPSpecifyPageLength >> pageLength: numberOfDots [
	pageLength := numberOfDots
]

{ #category : #writing }
ESCPSpecifyPageLength >> writeBytesOn: aBinaryStream [
	(self pageLength isNil
		or: [ self pageLength isInteger not
		or: [( self pageLength between: 0 and: 12000) not ] ])
		ifTrue: [ self commandIsBadConfigured: #pageLength ].
	aBinaryStream
		nextPut: self esc;
		nextPut: $( codePoint;
		nextPut: $C codePoint;
		nextPut: 2;
		nextPut: 0;
		nextPut: (self pageLength % 256);
		nextPut: (self pageLength // 256).
	
		
]
