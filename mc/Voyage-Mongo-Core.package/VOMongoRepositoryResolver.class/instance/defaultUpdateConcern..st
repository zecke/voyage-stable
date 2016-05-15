concerns
defaultUpdateConcern: aConcern
	aConcern ifNotNil: [:dict | dict at: 'getLastError' put: 1 ].
	defaultUpdateConcern := aConcern