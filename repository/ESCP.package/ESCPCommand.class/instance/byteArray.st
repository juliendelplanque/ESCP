writing
byteArray
	^ ByteArray streamContents: [ :s | self writeBytesOn: s ]