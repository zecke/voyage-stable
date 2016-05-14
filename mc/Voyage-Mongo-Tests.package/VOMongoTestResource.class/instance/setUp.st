running
setUp
	| concern  |
	concern := { 'w' -> 1. 'wtimeout' -> 1000. 'j' -> true } asDictionary.
	super setUp.
	repository := (VOMongoRepository 
		host: self class mongoHost
		database: 'Voyage-Tests')
		defaultInsertConcern: concern;
		defaultUpdateConcern: concern;
		defaultRemoveConcern: concern;
		yourself
		