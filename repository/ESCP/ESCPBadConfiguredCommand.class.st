"
I am the error raised when an ESCP command is bad configured and thus, can not be serialized as a byte array.
"
Class {
	#name : #ESCPBadConfiguredCommand,
	#superclass : #Error,
	#instVars : [
		'command',
		'attribute'
	],
	#category : 'ESCP'
}

{ #category : #accessing }
ESCPBadConfiguredCommand >> attribute [
	^ attribute
]

{ #category : #accessing }
ESCPBadConfiguredCommand >> attribute: anObject [
	attribute := anObject
]

{ #category : #accessing }
ESCPBadConfiguredCommand >> command [
	^ command
]

{ #category : #accessing }
ESCPBadConfiguredCommand >> command: anObject [
	command := anObject
]

{ #category : #accessing }
ESCPBadConfiguredCommand >> messageText [
	^ String streamContents: [ :s |
		s << 'Command '.
		self command printOn: s.
		s
			<< ' has its attribute #';
			<< self attribute;
			<< ' is bad configured.' ]
]
