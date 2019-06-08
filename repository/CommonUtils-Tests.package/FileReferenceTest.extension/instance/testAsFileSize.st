*CommonUtils-Tests
testAsFileSize

	| ref contents |
	contents := '12345
abcdf!'.
	ref := filesystem * 'file'.
	[ 
		ref writeStreamDo: [ : stream | stream nextPutAll: '' ].	
		self assert: ref asFileSize equals: '0 B'.	

		ref writeStreamDo: [ : stream | stream nextPutAll: contents ].
		self assert: ref asFileSize equals: '12 B'.	
	]
	ensure: [ ref ensureDelete ]