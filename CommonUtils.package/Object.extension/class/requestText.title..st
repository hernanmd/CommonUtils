*CommonUtils
requestText: aString title: titleString
	" Open a modal message dialog requesting aString with titleString as title. Answer <nil> if dialog was cancelled "

	^ self 
		requestText: aString 
		initialAnswer: String empty 
		title: titleString