"
Cancel italic style that was applied to the text text before this command.
"
Class {
	#name : #ESCPCancelItalicStyle,
	#superclass : #ESCPCommand,
	#category : 'ESCP'
}

{ #category : #writing }
ESCPCancelItalicStyle >> writeBytesOn: aBinaryStream [
	aBinaryStream
		nextPut: self esc;
		nextPut: 16r35
]
