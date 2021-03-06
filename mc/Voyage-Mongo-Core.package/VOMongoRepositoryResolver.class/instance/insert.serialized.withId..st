private persistence
insert: anObject serialized: jsonDictionary withId: aOID
	self pool withDatabase: [ :db | 
		(self collectionAt: anObject class inDatabase: db) 
			add: (jsonDictionary
				at: '_id' put: aOID;
				yourself).
		(self insertConcernFor: anObject class) ifNotNil: [:concern |
			| res |
			res := db command: concern concernForGetLastError.
			(res at: 'code' ifAbsent: [nil]) ifNotNil: [:code |
				^(VOMongoInsertError code: code) signal]]].
	^aOID