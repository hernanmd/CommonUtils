Extension { #name : #FileReference }

{ #category : #'*CommonUtils' }
FileReference >> asFileSize [
	" Answer a <String> of the receiver size in human-readable form "

	^ self size asFileSize
]

{ #category : #'*CommonUtils' }
FileReference >> contents [
	"Answer a <String> with all of the contents of the receiver."

	^ self readStream contents asString
]

{ #category : #'*CommonUtils' }
FileReference >> cut: indexes to: outStream [
	" Answer a <Collection> with columns at indexes. 

	This is similar to UNIX command : cut -f i1,i2,i3 file 
	"
	^ self 
		cut: indexes 
		to: outStream 
		separator: Character tab
]

{ #category : #'*CommonUtils' }
FileReference >> cut: indexes to: outStream separator: aCharacter [
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
]

{ #category : #'*CommonUtils' }
FileReference >> tailn: aNumber [
	" This performs the same operation as the command tail -n +aNumber on the receiver.
	It does not depend of structure of lines (i.e. #skipHeader) "

	| stream |
	stream := self contents readStream.
	aNumber - 1 timesRepeat: [ stream nextLine ].
	^ stream upToEnd
]
