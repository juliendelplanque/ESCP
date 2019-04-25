Class {
	#name : #ESCPSpecify50DotsLineFeed,
	#superclass : #ESCPCommand,
	#category : 'ESCP'
}

{ #category : #writing }
ESCPSpecify50DotsLineFeed >> writeBytesOn: aBinaryStream [
	aBinaryStream
		nextPut: self esc;
		nextPut: 16r32
]
