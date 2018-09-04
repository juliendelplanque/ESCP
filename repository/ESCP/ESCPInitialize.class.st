Class {
	#name : #ESCPInitialize,
	#superclass : #ESCPCommand,
	#category : 'ESCP'
}

{ #category : #writing }
ESCPInitialize >> writeBytesOn: aBinaryStream [
	aBinaryStream
		<< self esc;
		<< $@ codePoint
]
