"
Cancel bold style that was applied to the text text before this command.
"
Class {
	#name : #ESCPCancelBoldStyle,
	#superclass : #ESCPCommand,
	#category : 'ESCP'
}

{ #category : #writing }
ESCPCancelBoldStyle >> writeBytesOn: aBinaryStream [
	aBinaryStream
		nextPut: self esc;
		nextPut: 16r46
]
