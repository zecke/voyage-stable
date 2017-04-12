class initialization
registerToNotifications
	self unregisterToNotifications.
	SystemAnnouncer uniqueInstance
		when: MethodAdded send: #resetDescriptionCacheFromMethod: to: self;
		when: MethodModified send: #resetDescriptionCacheFromMethod: to: self;
		when: MethodRemoved send: #resetDescriptionCacheFromMethod: to: self