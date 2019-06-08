*CommonUtils
cut: indexes to: outStream
	" Answer a <Collection> with columns at indexes. 

	This is similar to UNIX command : cut -f i1,i2,i3 file 
	"
	^ self 
		cut: indexes 
		to: outStream 
		separator: Character tab