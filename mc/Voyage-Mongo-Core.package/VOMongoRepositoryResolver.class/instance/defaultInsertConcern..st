concerns
defaultInsertConcern: aConcern
	aConcern ifNotNil: [:dict | dict at: 'getLastError' put: 1 ].
	defaultInsertConcern := aConcern.