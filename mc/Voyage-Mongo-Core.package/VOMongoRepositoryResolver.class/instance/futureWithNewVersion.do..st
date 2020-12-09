private persistence
futureWithNewVersion: aFuture do: aBlock
	| newVersion |
	
	newVersion := repository versionGenerator newVersion.
	aBlock 
		value: aFuture futureId
		value: aFuture realObject 
		value: (aFuture serialized 
			at: VOMongoJSONSerializer fieldVersion put: newVersion;
			yourself).

	self cache cacheObject: aFuture realObject id: aFuture futureId version: newVersion. 