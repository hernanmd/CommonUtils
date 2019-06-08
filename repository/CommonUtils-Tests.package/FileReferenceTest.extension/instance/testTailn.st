*CommonUtils-Tests
testTailn

	| ref contents expected |
	contents := '12345
abcdf!'.
	expected := 'abcdf!'.
	ref := filesystem * 'file'.
	[ 
		ref writeStreamDo: [ : stream | stream nextPutAll: contents ].
		self assert: (ref tailn: 1) equals: contents.
		self assert: (ref tailn: 2) equals: expected.
		self assert: (ref tailn: 3) equals: ''.
	]
	ensure: [ ref ensureDelete ]