*CommonUtils-Tests
testCutTo

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