accessing
updateConcern: aConcern
	aConcern ifNotNil: [:dict | dict at: 'getLastError' put: 1 ].
	self
		propertyAt: #updateConcern
		put: aConcern
