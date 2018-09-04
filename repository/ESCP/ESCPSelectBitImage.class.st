Class {
	#name : #ESCPSelectBitImage,
	#superclass : #ESCPCommand,
	#instVars : [
		'm',
		'bytes'
	],
	#category : 'ESCP'
}

{ #category : #accessing }
ESCPSelectBitImage >> bytes [
	^ bytes
]

{ #category : #accessing }
ESCPSelectBitImage >> bytes: anObject [
	bytes := anObject
]

{ #category : #accessing }
ESCPSelectBitImage >> m [
	^ m
]

{ #category : #accessing }
ESCPSelectBitImage >> m: anObject [
	m := anObject
]

{ #category : #writing }
ESCPSelectBitImage >> writeBytesOn: aBinaryStream [
	(self bytes isNil or: [ 
		self bytes class ~= ByteArray or: [ 
			(self bytes size between: 0 and: 2816) not ] ])
		ifTrue: [ self commandIsBadConfigured: #bytes ].
		
	(self m isNil or: [ 
		self m isInteger not or: [ 
			(#(0 1 2 3 4 6 32 33 38 39 40 71 72 73) includes: m) not ] ])
		ifTrue: [ self commandIsBadConfigured: #m ]. 
		
	aBinaryStream
		<< self esc;
		<< $* codePoint;
		<< self m;
		<< (self bytes size % 256);
		<< (self bytes size // 256);
		<< self bytes
]
