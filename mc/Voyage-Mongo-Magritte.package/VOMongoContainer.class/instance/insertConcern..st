accessing
insertConcern: aConcern
	aConcern ifNotNil: [:dict | dict at: 'getLastError' put: 1 ].
	self
		propertyAt: #insertConcern
		put: aConcern
