sending to printer
cupsSendToPrinterNamed: aString
	"Send the script to the printer named #aString for printing using CUPS' lp command line utility."
	| tempFile |
	tempFile := FileLocator temp / (UUID new asString36 , '.escp').
	self writeBytesInFile: tempFile.
	LibC uniqueInstance
		system: ('lp -d {1} {2}' format: { aString . tempFile fullName}).
	tempFile ensureDelete