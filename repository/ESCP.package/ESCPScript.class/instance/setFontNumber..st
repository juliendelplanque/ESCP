building
setFontNumber: anInteger
	self add: (ESCPSelectFont new
					fontNumber: anInteger;
					yourself)