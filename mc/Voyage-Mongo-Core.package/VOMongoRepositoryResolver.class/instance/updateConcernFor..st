concerns
updateConcernFor: aClass
	updateConcerns at: aClass ifPresent: [:val | ^val].
	^defaultUpdateConcern