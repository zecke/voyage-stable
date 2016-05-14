as yet unclassified
basicRemoveCollection: aClass
	self pool withDatabase:  [ :db | 
		(self collectionAt: aClass inDatabase: db) drop.
		(self removeConcernFor: aClass) ifNotNil: [:concern |
			| res |
			concern at: 'getLastError' put: 1.
			res := db command: concern.
			(res at: 'err' ifAbsent: [nil]) ifNotNil: [
				^self error: 'Removing collection failed']] ].
