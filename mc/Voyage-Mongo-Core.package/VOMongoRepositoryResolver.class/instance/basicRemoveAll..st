private persistence
basicRemoveAll: aClass
	self pool withDatabase:  [ :db | 
		(self collectionAt: aClass inDatabase: db) remove: Dictionary new.
		(self removeConcernFor: aClass) ifNotNil: [:concern |
			| res |
			res := db command: concern concernForGetLastError.
			(res at: 'err' ifAbsent: [nil]) ifNotNil: [
				^self error: 'Removing all failed']]].