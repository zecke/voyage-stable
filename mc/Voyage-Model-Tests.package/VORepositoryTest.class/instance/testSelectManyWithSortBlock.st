tests
testSelectManyWithSortBlock
	| fetched |
	self repository
		save: (VOTestPilot new name: 'Esteban');
		save: (VOTestPilot new name: 'Mariano');
		save: (VOTestPilot new name: 'Stef');
		save: (VOTestPilot new name: 'Camillo');
		save: (VOTestPilot new name: 'Igor');
		save: (VOTestPilot new name: 'Markus');
		yourself.
	self repository flushCache.
	self waitForWriteOperation.
	fetched := self repository
		selectMany: VOTestPilot
		where: [ :each | each name notNil ]
		sortBy: #name