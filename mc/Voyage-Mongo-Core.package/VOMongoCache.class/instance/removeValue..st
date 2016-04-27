removing
removeValue: anObject
	| oid |
	self mutex critical: [ 
		oid := (self keyAtValue: anObject) .
		objects removeKey: oid ifAbsent: [].
		timeStamps removeKey: oid ifAbsent: [] ]