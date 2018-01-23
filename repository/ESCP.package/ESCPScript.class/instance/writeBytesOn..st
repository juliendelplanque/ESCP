writing
writeBytesOn: aBinaryStream
	self commands do: [ :command |
		command writeBytesOn: aBinaryStream ]