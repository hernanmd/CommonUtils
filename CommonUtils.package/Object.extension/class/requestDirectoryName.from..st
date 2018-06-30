*CommonUtils
requestDirectoryName: messageString from: initialPath
	" Open request dialog to select a directory "
	
	^ UIManager default 
		chooseDirectory: messageString
		from: initialPath