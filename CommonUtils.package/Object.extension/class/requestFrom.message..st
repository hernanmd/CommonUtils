*CommonUtils
requestFrom: aList message: messageString
	" Choose an item from the given list. Answer the index of the selected item."
	
	^ UIManager default chooseFrom: aList lines: #() message: messageString