Extension { #name : #Integer }

{ #category : #'*CommonUtils' }
Integer >> asFileSize [
	" From Magritte-Model.MetaGUI-SeanDeNigris.459.mcz "

	#( 'B' 'KB' 'MB' 'GB' 'TB' 'PB' 'EB' 'ZB' 'YB' )
		inject: self
		into: [ :value :each |
			value < 1024
				ifFalse: [ value // 1024 ]
				ifTrue: [ 
					^ String streamContents: [ : stream |
							stream 
								nextPutAll: value asString;
								space;
								nextPutAll: each ] ] ]

]

{ #category : #'*CommonUtils' }
Integer >> digitCount [
	" Answer a <Number> representing how many digits contains the receiver "
	
	^ self asString size
]

{ #category : #'*CommonUtils' }
Integer >> fillMatrix: aMatrix atColumn: aColumnNumber [

	| generator repetitionsNum |
	
	repetitionsNum := aMatrix rows size.
	generator := Generator on: [: g | repetitionsNum timesRepeat: [ g yield: self ] ].
	aMatrix 
		atColumn: aColumnNumber 
		put: generator upToEnd.
]

{ #category : #'*CommonUtils' }
Integer >> fillMatrix: aMatrix atColumn: aColumnNumber repeat: aRepeatNumber [

	| generator |
	generator := Generator on: [: g | 
		aRepeatNumber timesRepeat: [ g yield: self ] ].
	aMatrix 
		atColumn: aColumnNumber 
		put: generator upToEnd.
]
