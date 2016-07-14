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
			res := db command: concern.
			((res at: 'ok' ifAbsent: [1]) = 1) ifFalse: [
				^self error: 'Updating failed']] ].

	^aOID