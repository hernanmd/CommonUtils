*CommonUtils
dumpToStream: aStream 
	" Write the receiver's contents into aStream "
	
	aStream nextPutAll: self contents.