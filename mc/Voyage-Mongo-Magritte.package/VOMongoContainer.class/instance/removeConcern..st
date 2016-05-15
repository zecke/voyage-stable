accessing
removeConcern: aConcern
	aConcern ifNotNil: [:dict | dict at: 'getLastError' put: 1 ].
	self
		propertyAt: #removeConcern
		put: aConcern
