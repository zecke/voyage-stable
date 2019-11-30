external projects
mongoTalk: spec
	spec 
		baseline: 'MongoTalk' 
			with: [ spec repository: 'github://zecke/mongotalk:features-sdam2/mc';
			loads: #( 'SDAM' ) ];
		import: 'MongoTalk'
