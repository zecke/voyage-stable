private persistence
update: anObject serialized: jsonDictionary withId: aOID
	self pool withDatabase: [ :db |
		(self collectionAt: anObject class inDatabase: db) 
			replace: {'_id'->aOID} asDictionary
			with: (jsonDictionary
				at: '_id' put: aOID;
				yourself).
		(self updateConcernFor: anObject class) ifNotNil: [:concern |
			| res |
			concern at: 'getLastError' put: 1.
			res := db command: concern.
			(res at: 'err' ifAbsent: [nil]) ifNotNil: [
				^self error: 'Updating failed']] ].

	^aOID