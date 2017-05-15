concerns
insertConcernFor: aClass
	insertConcerns at: aClass ifPresent: [:val | ^val].
	^defaultInsertConcern.