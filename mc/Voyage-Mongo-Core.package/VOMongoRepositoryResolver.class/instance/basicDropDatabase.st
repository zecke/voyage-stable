private persistence
basicDropDatabase
	self pool withDatabase:  [ :db |
		db drop.
		defaultRemoveConcern ifNotNil: [:concern |
			| res |
			concern at: 'getLastError' put: 1.
			res := db command: concern.
			(res at: 'err' ifAbsent: [nil]) ifNotNil: [
				^self error: 'Drop failed']]].