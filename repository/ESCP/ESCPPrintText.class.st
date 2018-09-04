Class {
	#name : #ESCPPrintText,
	#superclass : #ESCPCommand,
	#instVars : [
		'string'
	],
	#category : 'ESCP'
}

{ #category : #'instance creation' }
ESCPPrintText class >> string: aString [
	^ self new
		string: aString;
		yourself
]

{ #category : #accessing }
ESCPPrintText >> string [
	^ string
]

{ #category : #accessing }
ESCPPrintText >> string: anObject [
	string := anObject
]

{ #category : #writing }
ESCPPrintText >> writeBytesOn: aBinaryStream [
	self string isString
		ifFalse: [ self commandIsBadConfigured: #string ].
	aBinaryStream
		<< self string asByteArray
]
