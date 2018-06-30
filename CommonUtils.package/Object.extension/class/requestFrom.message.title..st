*CommonUtils
requestFrom: aList message: messageString title: aString
	" Choose an item from the given list. Answer the index of the selected item."
	
	^ UIManager default chooseFrom: aList lines: #() message: messageString title: aString