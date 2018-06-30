*CommonUtils
requestFileNameForSave: extensionString default: defaultString
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