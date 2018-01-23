accessing
messageText
	^ String streamContents: [ :s |
		s << 'Command '.
		self command printOn: s.
		s
			<< ' has its attribute #';
			<< self attribute;
			<< ' is bad configured.' ]