concerns
insertConcernFor: aClass
	| description |
	"This is a mess. What should be stronger? Default weaker than class? But how to change it?"
	insertConcerns at: aClass ifPresent: [:val | ^val].

	description := repository descriptionBuilder for: aClass.
	description insertConcern ifNotNil: [:concern |
		^concern].
	^defaultInsertConcern.