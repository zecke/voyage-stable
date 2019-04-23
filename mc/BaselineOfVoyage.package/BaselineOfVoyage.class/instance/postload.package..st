acks
postload: a package: b
	ImageWorker compile: 'forkImage
	self updateSession.

	"Make sure there is an accessible sources file for the new image. Make sure that there
	is a sources file next to the image if there is currently one next to the image. On Unix
	systems we could optimize and make a symlink."
	(Smalltalk sourcesFile isChildOf: Smalltalk imageFile parent asFileReference) ifTrue: [
		| destSources |
		destSources := baseFile parent / Smalltalk sourcesFile basename.
		destSources deleteIfAbsent: [].
		destSources parent ensureCreateDirectory. 
		Smalltalk sourcesFile copyTo: destSources.
	].
	"Trying to avoid running any commandline handlers when running the forked image"
	Smalltalk backupTo: self baseFile fullName.
	NonInteractiveTranscript allInstancesDo: [ :each | each initializeStream ].'
