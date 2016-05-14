private persistence
insert: anObject serialized: jsonDictionary withId: aOID
	self pool withDatabase: [ :db | 
		(self collectionAt: anObject class inDatabase: db) 
			add: (jsonDictionary
				at: '_id' put: aOID;
				yourself).
		(self insertConcernFor: anObject class) ifNotNil: [:concern |
			| res |
			concern at: 'getLastError' put: 1.
			res := db command: concern.
			(res at: 'err' ifAbsent: [nil]) ifNotNil: [
				^self error: 'Inserting failed']]].

	^aOID