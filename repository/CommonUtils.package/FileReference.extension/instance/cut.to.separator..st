*CommonUtils
cut: indexes to: outStream separator: aCharacter
	" Answer a <Collection> with columns at indexes. 

	This is similar to UNIX command : cut -f i1,i2,i3 file 
	"
	(Smalltalk hasClassNamed: #NeoCSVReader)
			ifFalse: [ ^ self informMessage: 'This method requires NeoCSVReader class' ].
	^ [ ((Smalltalk at: #NeoCSVReader) on: self readStream)
			separator: aCharacter;
			do: [ : r | 
				outStream 
					nextPutAll: ((indexes collect: [ : i | r at: i ]) joinUsing: aCharacter);
					nextPutTerminator ].
			outStream contents ]
		ensure: [ outStream close ]