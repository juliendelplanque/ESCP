"
Apply italic style to the text following this command.
"
Class {
	#name : #ESCPApplyItalicStyle,
	#superclass : #ESCPCommand,
	#category : 'ESCP'
}

{ #category : #writing }
ESCPApplyItalicStyle >> writeBytesOn: aBinaryStream [
	aBinaryStream
		nextPut: self esc;
		nextPut: 16r34
]
