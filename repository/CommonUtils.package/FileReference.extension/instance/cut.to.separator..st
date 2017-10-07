*CommonUtils
cut: indexes to: outputFileStream separator: aCharacter
	" Answer a <Collection> with columns at indexes. 

	This is similar to UNIX command : cut -f i1,i2,i3 file 
	"
	[ (Smalltalk hasClassNamed: #NeoCSVReader)
			ifFalse: [ ^ self informMessage: 'This method requires NeoCSVReader class' ].
		(NeoCSVReader on: self readStream)
			separator: Character tab;
			rowsDo: [ : r | 
				outputFileStream 
					nextPutAll: ((indexes collect: [ : i | r at: i ]) joinUsing: aCharacter);
					nextPutTerminator ] ]
		ensure: [ outputFileStream close ]