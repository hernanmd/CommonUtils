*CommonUtils
requestText: aString title: titleString
	" Open a modal message dialog requesting aString with titleString as title "

	^ UIManager default 
		request: aString
		initialAnswer: String empty
		title: titleString