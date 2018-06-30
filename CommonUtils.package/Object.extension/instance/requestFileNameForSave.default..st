*CommonUtils
requestFileNameForSave: extensionString default: defaultString
	" Private - Request file name to the user. Answer a <String> with the full path name, or an empty <String> meaning dialog was cancelled "
	
	self class requestFileNameForSave: extensionString default: defaultString