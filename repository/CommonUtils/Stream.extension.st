Extension { #name : #Stream }

{ #category : #'*CommonUtils' }
Stream >> dumpToStream: aStream [ 
	" Write the receiver's contents into aStream "
	
	aStream nextPutAll: self contents.
]

{ #category : #'*CommonUtils' }
Stream >> first: n [
	"Answer the first n elements of the receiver.
	Raise an error if there are not enough elements."
	
	self reset.
	^ self next: n
]

{ #category : #'*CommonUtils' }
Stream >> nextPutAll: aCollection between: firstChar and: lastChar [
	" Append the elements of aCollection between the association Character elements onto the stream. "
		
	self 
		nextPut: firstChar;
		nextPutAll: aCollection asString;
		nextPut: lastChar
]

{ #category : #'*CommonUtils' }
Stream >> nextPutFirst: aCollection between: anAssociation [
	" Append the first elements of aCollection between the association 
	elements onto the stream. Answer aCollection. "
	
	| subCol |
	subCol := aCollection size >= 15
		ifTrue: [ aCollection asString first: 15 ]
		ifFalse: [ aCollection asString first: aCollection size ].
	self 
		space;
		nextPut: anAssociation key;
		nextPutAll: subCol ;
		nextPutAll: '...';
		nextPut: anAssociation value
]

{ #category : #'*CommonUtils' }
Stream >> nextPutTerminator [
	" Append a line ending terminator to the receiver "

	self nextPutAll: (String perform: self platformTerminator)
]
