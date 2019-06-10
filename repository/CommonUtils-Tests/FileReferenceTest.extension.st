Extension { #name : #FileReferenceTest }

{ #category : #'*CommonUtils-Tests' }
FileReferenceTest >> testAsFileSize [

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
]

{ #category : #'*CommonUtils-Tests' }
FileReferenceTest >> testCutTo [

	| ref contents outStream exp1 exp2 exp3 |
	contents := 'cell11	cell12	cell13
cell21	cell22	cell23'.
	ref := filesystem * 'file'.
	ref writeStreamDo: [ : stream | stream nextPutAll: contents ].
	exp1 := 'cell11
cell21
'.
	exp2 := 'cell11	cell13
cell21	cell23
'.
	exp3 := '

'.
	outStream := ReadWriteStream on: (String new: 15).
	[ 
		self assert: (ref cut: #(1) to: outStream) equals: exp1.
		outStream := ReadWriteStream on: (String new: 15).
		self assert: (ref cut: #(1 3) to: outStream) equals: exp2.
		outStream := ReadWriteStream on: (String new: 15).
		self assert: (ref cut: #() to: outStream) equals: exp3.
	]
	ensure: [ ref ensureDelete ]
]

{ #category : #'*CommonUtils-Tests' }
FileReferenceTest >> testCutToSeparator [

	| ref contents outStream sep exp1 exp2 exp3 |
	
	sep := $;.
	contents := 'cell11;cell12;cell13
cell21;cell22;cell23'.
	ref := filesystem * 'file'.
	ref writeStreamDo: [ : stream | stream nextPutAll: contents ].
	exp1 := 'cell11
cell21
'.
	exp2 := 'cell11;cell13
cell21;cell23
'.
	exp3 := '

'.
	outStream := ReadWriteStream on: (String new: 15).
	[ 
		self assert: (ref cut: #(1) to: outStream separator: sep) equals: exp1.
		outStream := ReadWriteStream on: (String new: 15).
		self assert: (ref cut: #(1 3) to: outStream separator: sep) equals: exp2.
		outStream := ReadWriteStream on: (String new: 15).
		self assert: (ref cut: #() to: outStream separator: sep) equals: exp3.
	]
	ensure: [ ref ensureDelete ]
]

{ #category : #'*CommonUtils-Tests' }
FileReferenceTest >> testTailn [

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
]
