private
collectionAt: aClass inDatabase: db
 	| collectionName |
	collectionName := self collectionNameFor: aClass.
	 ^((collections 
		at: collectionName
		ifAbsentPut: [ db addCollection: collectionName ]) copy)
		setDatabase: db name: collectionName;
		yourself