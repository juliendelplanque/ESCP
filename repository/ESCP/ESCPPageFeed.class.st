"
Create a new page. This cause the printer to cut the paper.
"
Class {
	#name : #ESCPPageFeed,
	#superclass : #ESCPCommand,
	#category : 'ESCP'
}

{ #category : #writing }
ESCPPageFeed >> writeBytesOn: aBinaryStream [
	aBinaryStream
		nextPut: 16r0C
]
