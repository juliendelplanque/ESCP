writing
writeBytesInFile: aFileReference
	aFileReference writeStreamDo: [ :s |
		s binary.
		self writeBytesOn: s ]