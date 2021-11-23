Extension { #name : #SequenceableCollection }

{ #category : #'*CommonUtils' }
SequenceableCollection >> enumerateWithSize: aSize subSize: sSize in: anArray do: aBlock [

    aSize < sSize
        ifTrue: [ ^self error: 'subSize cannot exceed array size' ].
    sSize < 1
        ifTrue: [ ^self error: 'sizes must be positive' ].
    sSize = 1
        ifTrue: [
            self do: [ :each |
                aBlock value: (anArray at: aSize - sSize + 1 put: each ; yourself) ] ]
        ifFalse: [
            self do: [ :each |
                self enumerateWithSize: aSize subSize: sSize - 1 in: anArray do: [ :eachArray |
                    aBlock value: (eachArray at: aSize - sSize + 1 put: each ; yourself) ] ] ]
]

{ #category : #'*CommonUtils' }
SequenceableCollection >> enumerationsDo: aBlock [

	self enumerationsOfSize: self size do: aBlock
]

{ #category : #'*CommonUtils' }
SequenceableCollection >> enumerationsOfSize: aSize [

   | result |

   result := OrderedCollection new: aSize.
   self 
		enumerationsOfSize: aSize
		do: [ : each | result add: (each joinUsing: self class empty) ].
	^ result
]

{ #category : #'*CommonUtils' }
SequenceableCollection >> enumerationsOfSize: aSize do: aBlock [
   | anArray |

   anArray := Array new: aSize.
   self enumerateWithSize: aSize subSize: aSize in: anArray do: [ : each | aBlock value: each ]
]

{ #category : #'*CommonUtils' }
SequenceableCollection >> selectAtEvenPositions [
	"Answer a new collection like the receiver which contains all elements of the receiver at the even positions.

	#('a' 1 2 'b' 'c' 'd') selectAtEvenPositions =  #(1 'b' 'd') . "
	
	^ self atAll: ((1 to: self size) select: #even). 
	
	
]

{ #category : #'*CommonUtils' }
SequenceableCollection >> selectAtOddPositions [
	"Answer a new collection like the receiver which contains all elements of the receiver at the odd positions.

	#('a' 1 2 'b' 'c' 'd') selectAtOddPositions =  #('a' 2 'c') . "
	
	^ self atAll: ((1 to: self size) select: #odd). 
	
	
]

{ #category : #'*CommonUtils' }
SequenceableCollection >> tripleDo: aBlock [
    " Assume receiver with 3-element triples. The block is called with 3 arguments for each 3 elements in the receiver, stepping by one. If there's an odd number of items, ignore the last one(s). "

	1 to: self size - 2 do: [ :index |
		aBlock 
			value: (self at: index) 
			value: (self at: index + 1)
			value: (self at: index + 2) ]
]

{ #category : #'*CommonUtils' }
SequenceableCollection >> tripleSelect: aBlock [
    " Assume receiver with 3-element triples. The block is called with 3 arguments for each 3 elements in the receiver, stepping by one. If there's an odd number of items, ignore the last one(s). "

	| each1 each2 each3 |
	^ self class new: self size * 3 streamContents: [ : stream|
		1 to: self size - 2 do: [ :index |
			(aBlock 			
				value: (each1 := self at: index) 
				value: (each2 := self at: index + 1)
				value: (each3 := self at: index + 2))
					ifTrue: [ 
						stream 
							nextPut: each1;
							nextPut: each2;
							nextPut: each3 ] ] ]
]

{ #category : #'*CommonUtils' }
SequenceableCollection >> triplesDo:aBlock [
    " Assume receiver with 3-element triples. The block is called with 3 arguments for each 3 elements in the receiver, stepping by 3. If there's an odd number of items, ignore the last one(s). "

	1 to: self size // 3 do: [ :index |
         aBlock 
			value: (self at: 3 * index - 2) 
			value: (self at: 3 * index - 1)
			value: (self at: 3 * index) ]
]

{ #category : #'*CommonUtils' }
SequenceableCollection >> with: firstCollection with: secondCollection do: threeArgBlock [
	"Evaluate threeArgBlock with corresponding elements from this firstCollection and secondCollection."
	
	((firstCollection size = secondCollection size) and: [ firstCollection size = self size ]) 
			ifFalse: [ self error: 'collections all must be the same size' ].
	1 to: self size do: [ :index | threeArgBlock 
			value: (self at: index)
			value: (firstCollection at: index)
			value: (secondCollection at: index) ]
]
