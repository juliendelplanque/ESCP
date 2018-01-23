building
doInBoldStyle: aBlock
	self applyBoldStyle.
	aBlock cull: self.
	self cancelBoldStyle