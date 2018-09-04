Class {
	#name : #ESCPSpecify50DotsLineFeed,
	#superclass : #ESCPCommand,
	#category : 'ESCP'
}

{ #category : #writing }
ESCPSpecify50DotsLineFeed >> writeBytesOn: aBinaryStream [
	aBinaryStream
		<< self esc;
		<< 16r32
]
