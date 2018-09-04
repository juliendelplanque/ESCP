Class {
	#name : #ESCPSpecify38DotsLineFeed,
	#superclass : #ESCPCommand,
	#category : 'ESCP'
}

{ #category : #writing }
ESCPSpecify38DotsLineFeed >> writeBytesOn: aBinaryStream [
	aBinaryStream
		<< self esc;
		<< 16r30
]
