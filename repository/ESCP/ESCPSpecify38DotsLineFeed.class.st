Class {
	#name : #ESCPSpecify38DotsLineFeed,
	#superclass : #ESCPCommand,
	#category : 'ESCP'
}

{ #category : #writing }
ESCPSpecify38DotsLineFeed >> writeBytesOn: aBinaryStream [
	aBinaryStream
		nextPut: self esc;
		nextPut: 16r30
]
