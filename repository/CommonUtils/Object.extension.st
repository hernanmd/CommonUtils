Extension { #name : #Object }

{ #category : #'*CommonUtils' }
Object class >> alertMessage: aString [
	" Open a modal message dialog displaying aString "
	" This should be in a SpecUIAddOns-Polymorph package "
	
	self flag: #toDo.
	^ UITheme builder alert: aString
]

{ #category : #'*CommonUtils' }
Object >> alertMessage: aString [
	" Open a modal message dialog. "

	^ self class alertMessage: aString
]

{ #category : #'*CommonUtils' }
Object class >> classFor: aLiteralOrClass [
	" Answer the class for aLiteralOrClass or nil if doesn't exists "

	^ aLiteralOrClass isLiteral
		ifTrue: [ Smalltalk at: aLiteralOrClass asSymbol ifAbsent: [ nil ] ]
		ifFalse: [ aLiteralOrClass ].
]

{ #category : #'*CommonUtils' }
Object >> classFor: aLiteralOrClass [
	" Answer the class for aLiteralOrClass or nil if doesn't exists "
	
	^ self class classFor: aLiteralOrClass
]

{ #category : #'*CommonUtils' }
Object >> dateClass [
	" Answer the class used to access dates "

	^ self class dateClass
]

{ #category : #'*CommonUtils' }
Object class >> dateClass [
	" Answer the class used to access dates "

	^ self classFor: #DateAndTime
]

{ #category : #'*CommonUtils' }
Object class >> informMessage: aString [
	" Open a modal message dialog displaying aString "
	" This should be in a SpecUIAddOns-Polymorph package "
	
	self flag: #toDo.
	^ UITheme builder message: aString
]

{ #category : #'*CommonUtils' }
Object >> informMessage: aString [
	" Open a modal message dialog. "

	^ self class informMessage: aString
]

{ #category : #'*CommonUtils' }
Object >> platformLabel [
	" Answer a <String> with descriptive label string for the platform implementation "
	
	^ GRPlatform current label
]

{ #category : #'*CommonUtils' }
Object >> platformSeparator [
	" Answer a <String> with the path separator "
	
	^ GRPlatform current pathSeparator
]

{ #category : #'*CommonUtils' }
Object >> platformTerminator [
	" Answer a <Symbol> used as selector. Defaults to the current platform terminator "
	
	Smalltalk os isWindows 
		ifTrue: [ ^ #crlf ].
	Smalltalk os isUnix 
		ifTrue: [ ^ #lf ].
	^ #cr
]

{ #category : #'*CommonUtils' }
Object class >> requestDirectoryName: messageString [
	" Open request dialog to select a directory "
	
	^ UIManager default 
		chooseDirectory: messageString
]

{ #category : #'*CommonUtils' }
Object >> requestDirectoryName: messageString [
	" Open request dialog to select a directory "
	
	^ self class requestDirectoryName: messageString

]

{ #category : #'*CommonUtils' }
Object class >> requestDirectoryName: messageString from: initialPath [
	" Open request dialog to select a directory "
	
	^ UIManager default 
		chooseDirectory: messageString
		from: initialPath
]

{ #category : #'*CommonUtils' }
Object >> requestDirectoryName: messageString from: initialPath [
	" Open request dialog to select a directory "
	
	^ self class requestDirectoryName: messageString from: initialPath

]

{ #category : #'*CommonUtils' }
Object >> requestFileNameForOpen: extensionString [
	" Open request dialog to select a file "
	
	^ self class requestFileNameForOpen: extensionString

]

{ #category : #'*CommonUtils' }
Object class >> requestFileNameForOpen: extensionString [
	" Open request dialog to select a file "
	
	^ UIManager default 
		chooseFullFileNameMatching: (Array with: extensionString)
		label: 'Choose ' , extensionString , ' file'
]

{ #category : #'*CommonUtils' }
Object class >> requestFileNameForSave: extensionString [
	" Private - Request file name to the user. Answer a <String> with the full path name, or an empty <String> meaning dialog was cancelled "
	
	| filename |
	
	filename := UITheme builder
		chooseForSaveFileReference: 'Save as ' , extensionString
		extensions: (Array with: extensionString)
		path: FileSystem workingDirectory.
	filename 
		ifNil: [ 
			self informMessage: 'Saving cancelled'. 
			^ String empty ].
	^ filename fullName
]

{ #category : #'*CommonUtils' }
Object >> requestFileNameForSave: extensionString [
	" Private - Request file name to the user. Answer a <String> with the full path name, or an empty <String> meaning dialog was cancelled "
	
	^ self class requestFileNameForSave: extensionString
]

{ #category : #'*CommonUtils' }
Object >> requestFileNameForSave: extensionString default: defaultString [
	" Private - Request file name to the user. Answer a <String> with the full path name, or an empty <String> meaning dialog was cancelled "
	
	self class requestFileNameForSave: extensionString default: defaultString
]

{ #category : #'*CommonUtils' }
Object class >> requestFileNameForSave: extensionString default: defaultString [
	" Private - Request file name to the user. Answer a <String> with the full path name, or an empty <String> meaning dialog was cancelled "
	
	| filename |
	filename := UITheme builder
		fileSave: 'Save as ' , extensionString
		initialAnswer: defaultString
		extensions: (Array with: extensionString)
		path: nil.
	filename ifNil: [ 
		self informMessage: 'Saving cancelled'. 
		^ String empty ].
	^ filename fullName
]

{ #category : #'*CommonUtils' }
Object class >> requestFrom: aList message: messageString [
	" Choose an item from the given list. Answer the index of the selected item."
	
	^ UIManager default chooseFrom: aList lines: #() message: messageString
]

{ #category : #'*CommonUtils' }
Object class >> requestFrom: aList message: messageString title: aString [
	" Choose an item from the given list. Answer the index of the selected item."
	
	^ UIManager default chooseFrom: aList lines: #() message: messageString title: aString
]

{ #category : #'*CommonUtils' }
Object class >> requestMessage: aString [
	" Open a request information modal message dialog. Answer <nil> if dialog was cancelled "

	^ UIManager default request: aString
]

{ #category : #'*CommonUtils' }
Object >> requestMessage: aString [
	" Open a request information modal message dialog. "

	^ self class requestMessage: aString
]

{ #category : #'*CommonUtils' }
Object class >> requestText: aString initialAnswer: initString title: titleString [
	" Open a modal message dialog requesting aString with titleString as title. Answer <nil> if dialog was cancelled "

	^ UIManager default 
		request: aString
		initialAnswer: initString
		title: titleString
]

{ #category : #'*CommonUtils' }
Object >> requestText: aString initialAnswer: initString title: titleString [
	" Open a modal message dialog requesting aString with titleString as title "
	
	^ self class 
		requestText: aString 
		initialAnswer: initString 
		title: titleString

]

{ #category : #'*CommonUtils' }
Object class >> requestText: aString title: titleString [
	" Open a modal message dialog requesting aString with titleString as title. Answer <nil> if dialog was cancelled "

	^ self 
		requestText: aString 
		initialAnswer: String empty 
		title: titleString
]

{ #category : #'*CommonUtils' }
Object >> requestText: aString title: titleString [
	" Open a modal message dialog requesting aString with titleString as title "
	
	^ self class requestText: aString title: titleString

]

{ #category : #'*CommonUtils' }
Object class >> serializerClass [
	" Answer a <Class> valid for serializing objects, or raise an exception if not found  "

	^ Smalltalk 
			at: #FLSerializer 
			ifAbsent: [ self error: 'FUEL library missing' ]
]

{ #category : #'*CommonUtils' }
Object >> serializerClass [
	" Answer a <Class> valid for serializing objects, or raise an exception if not found  "

	^ self class serializerClass
]
