concerns
removeConcernFor: aClass
	| description |
	"This is a mess. What should be stronger? Default weaker than class? But how to change it?"
	removeConcerns at: aClass ifPresent: [:val | ^val].

	description := repository descriptionBuilder for: aClass.
	description removeConcern ifNotNil: [:concern |
		^concern].
	^defaultRemoveConcern