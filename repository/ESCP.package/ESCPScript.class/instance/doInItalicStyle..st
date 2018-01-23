building
doInItalicStyle: aBlock
	self applyItalicStyle.
	aBlock cull: self.
	self cancelItalicStyle