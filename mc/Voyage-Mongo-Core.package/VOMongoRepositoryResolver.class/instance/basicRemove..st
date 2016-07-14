private persistence
basicRemove: anObject 
	self pool withDatabase: [ :db |
		(self collectionAt: anObject class inDatabase: db) 
			delete: { '_id'->(self keyOf: anObject)} asDictionary.
		(self removeConcernFor: anObject class) ifNotNil: [:concern |
			| res |
			res := db command: concern.
			((res at: 'ok' ifAbsent: [1]) = 1) ifFalse: [
				^self error: 'Removing failed']]]
