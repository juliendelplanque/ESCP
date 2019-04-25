Class {
	#name : #ESCPInitialize,
	#superclass : #ESCPCommand,
	#category : 'ESCP'
}

{ #category : #writing }
ESCPInitialize >> writeBytesOn: aBinaryStream [
	aBinaryStream
		nextPut: self esc;
		nextPut: $@ codePoint
]
