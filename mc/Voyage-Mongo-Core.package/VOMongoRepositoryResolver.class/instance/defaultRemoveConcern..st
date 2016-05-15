concerns
defaultRemoveConcern: aConcern
	aConcern ifNotNil: [:dict | dict at: 'getLastError' put: 1 ]. 
	defaultRemoveConcern := aConcern