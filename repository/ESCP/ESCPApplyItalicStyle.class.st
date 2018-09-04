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
		<< self esc;
		<< 16r34
]
