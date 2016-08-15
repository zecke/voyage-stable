concerns
insertConcern: aConcern for: aClass
	aConcern ifNotNil: [:dict | dict at: 'getLastError' put: 1 ].
	insertConcerns at: aClass put: aConcern