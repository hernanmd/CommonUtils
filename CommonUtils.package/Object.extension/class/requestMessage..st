*CommonUtils
requestMessage: aString
	" Open a request information modal message dialog. Answer <nil> if dialog was cancelled "

	^ UIManager default request: aString