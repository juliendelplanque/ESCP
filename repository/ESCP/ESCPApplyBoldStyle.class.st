"
Apply bold style to the text following this command.
"
Class {
	#name : #ESCPApplyBoldStyle,
	#superclass : #ESCPCommand,
	#category : 'ESCP'
}

{ #category : #writing }
ESCPApplyBoldStyle >> writeBytesOn: aBinaryStream [
	aBinaryStream
		<< self esc;
		<< 16r45
]
