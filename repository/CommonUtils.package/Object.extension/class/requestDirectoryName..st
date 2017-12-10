*CommonUtils
requestDirectoryName: messageString
	" Open request dialog to select a directory "
	
	^ UIManager default 
		chooseDirectory: messageString