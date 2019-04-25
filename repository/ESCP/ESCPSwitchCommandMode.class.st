Class {
	#name : #ESCPSwitchCommandMode,
	#superclass : #ESCPCommand,
	#instVars : [
		'commandMode'
	],
	#category : 'ESCP'
}

{ #category : #accessing }
ESCPSwitchCommandMode >> commandMode [
	^ commandMode
]

{ #category : #accessing }
ESCPSwitchCommandMode >> commandMode: anObject [
	commandMode := anObject
]

{ #category : #writing }
ESCPSwitchCommandMode >> writeBytesOn: aBinaryStream [
	(self commandMode isNotNil and: [ self commandMode isInteger ])
		ifFalse: [ self commandIsBadConfigured: #commandMode ].
	aBinaryStream
		nextPut: self esc;
		nextPut: $i codePoint;
		nextPut: $a codePoint;
		nextPut: self commandMode
		
]
