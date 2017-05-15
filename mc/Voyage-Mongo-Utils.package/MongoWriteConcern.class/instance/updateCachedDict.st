private
updateCachedDict
	cachedDict := { 
		'getLastError' -> 1.
	} asDictionary.
	self wValue ifNotNil: [:val |
		cachedDict at: 'w' put: val].
	self jValue ifNotNil: [:val |
		cachedDict at: 'j' put: val].
	self wtimeoutValue ifNotNil: [:val |
		cachedDict at: 'wtimeout' put: val].