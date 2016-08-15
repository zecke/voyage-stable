concerns
updateConcern: aConcern for: aClass
	aConcern ifNotNil: [:dict | dict at: 'getLastError' put: 1 ].
	updateConcerns at: aClass put: aConcern