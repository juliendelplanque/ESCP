"
Create a new line.
"
Class {
	#name : #ESCPLineFeed,
	#superclass : #ESCPCommand,
	#category : 'ESCP'
}

{ #category : #writing }
ESCPLineFeed >> writeBytesOn: aBinaryStream [
	aBinaryStream
		nextPut: Character lf codePoint
		
]
