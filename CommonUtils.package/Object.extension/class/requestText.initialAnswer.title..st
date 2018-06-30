*CommonUtils
requestText: aString initialAnswer: initString title: titleString
	" Open a modal message dialog requesting aString with titleString as title. Answer <nil> if dialog was cancelled "

	^ UIManager default 
		request: aString
		initialAnswer: initString
		title: titleString