Class {
	#name : #ESCPCommand,
	#superclass : #Object,
	#category : 'ESCP'
}

{ #category : #writing }
ESCPCommand >> byteArray [
	^ ByteArray streamContents: [ :s | self writeBytesOn: s ]
]

{ #category : #error }
ESCPCommand >> commandIsBadConfigured: attributeName [
	ESCPBadConfiguredCommand new
		command: self;
		attribute: attributeName;
		signal
]

{ #category : #constants }
ESCPCommand >> esc [
	^ Character escape codePoint
]

{ #category : #writing }
ESCPCommand >> writeBytesOn: aBinaryStream [
	self subclassResponsibility
]
