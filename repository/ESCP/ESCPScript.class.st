Class {
	#name : #ESCPScript,
	#superclass : #Object,
	#instVars : [
		'commands'
	],
	#category : 'ESCP'
}

{ #category : #adding }
ESCPScript >> add: aESCPCommand [
	self commands add: aESCPCommand
]

{ #category : #building }
ESCPScript >> applyBoldStyle [
	self add: ESCPApplyBoldStyle new.
]

{ #category : #building }
ESCPScript >> applyItalicStyle [
	self add: ESCPApplyItalicStyle new.
]

{ #category : #writing }
ESCPScript >> byteArray [
	^ ByteArray streamContents: [ :s | self writeBytesOn: s ]
]

{ #category : #building }
ESCPScript >> cancelBoldStyle [
	self add: ESCPCancelBoldStyle new.
]

{ #category : #building }
ESCPScript >> cancelItalicStyle [
	self add: ESCPCancelItalicStyle new.
]

{ #category : #accessing }
ESCPScript >> commands [
	^ commands
]

{ #category : #accessing }
ESCPScript >> commands: anObject [
	commands := anObject
]

{ #category : #'sending to printer' }
ESCPScript >> cupsSendToPrinterNamed: aString [
	"Send the script to the printer named #aString for printing using CUPS' lp command line utility."
	| tempFile |
	tempFile := FileLocator temp / (UUID new asString36 , '.escp').
	self writeBytesInFile: tempFile.
	LibC uniqueInstance
		system: ('lp -d {1} {2}' format: { aString . tempFile fullName}).
	tempFile ensureDelete
]

{ #category : #building }
ESCPScript >> doInBoldStyle: aBlock [
	self applyBoldStyle.
	aBlock cull: self.
	self cancelBoldStyle
]

{ #category : #building }
ESCPScript >> doInItalicStyle: aBlock [
	self applyItalicStyle.
	aBlock cull: self.
	self cancelItalicStyle
]

{ #category : #initialization }
ESCPScript >> initialize [
	super initialize.
	self commands: OrderedCollection new
]

{ #category : #building }
ESCPScript >> initializeESCP [
	self add: ESCPInitialize new.
]

{ #category : #building }
ESCPScript >> landscapeOrientation: aBoolean [
	self add: (ESCPSpecifyLandscapeOrientation new
					isLandscape: aBoolean;
					yourself)
]

{ #category : #building }
ESCPScript >> lf [
	self lineFeed
]

{ #category : #building }
ESCPScript >> lineFeed [
	self add: ESCPLineFeed new
]

{ #category : #building }
ESCPScript >> pageFeed [
	self add: ESCPPageFeed new.
]

{ #category : #building }
ESCPScript >> print: aString [
	self add: (ESCPPrintText string: aString)
]

{ #category : #building }
ESCPScript >> setCharacterSize: anInteger [
	self add: (ESCPSpecifyCharacterSize new
					characterSize: anInteger;
					yourself)
]

{ #category : #building }
ESCPScript >> setFontNumber: anInteger [
	self add: (ESCPSelectFont new
					fontNumber: anInteger;
					yourself)
]

{ #category : #building }
ESCPScript >> switchCommandMode: anInteger [
	self add: (ESCPSwitchCommandMode new
					commandMode: anInteger;
					yourself)
]

{ #category : #building }
ESCPScript >> switchToESCPMode [
	self switchCommandMode: 0
]

{ #category : #writing }
ESCPScript >> writeBytesInFile: aFileReference [
	aFileReference writeStreamDo: [ :s |
		s binary.
		self writeBytesOn: s ]
]

{ #category : #writing }
ESCPScript >> writeBytesOn: aBinaryStream [
	self commands do: [ :command |
		command writeBytesOn: aBinaryStream ]
]
