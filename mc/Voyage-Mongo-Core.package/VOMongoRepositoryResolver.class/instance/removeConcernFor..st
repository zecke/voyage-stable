concerns
removeConcernFor: aClass
	removeConcerns at: aClass ifPresent: [:val | ^val].
	^defaultRemoveConcern