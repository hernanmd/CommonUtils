Extension { #name : #TIterateTest }

{ #category : #'*CommonUtils-Tests' }
TIterateTest >> testSelectAtEvenPositions [

	self assert: #('a' 1 2 'b' 'c' 'd') selectAtEvenPositions equals: #(1 'b' 'd')
]

{ #category : #'*CommonUtils-Tests' }
TIterateTest >> testSelectAtOddPositions [

	self assert: #('a' 1 2 'b' 'c' 'd') selectAtOddPositions equals: #('a' 2 'c') 
]

{ #category : #'*CommonUtils-Tests' }
TIterateTest >> testTriplesDo [

	| testCol resultCol |
	
	testCol := #('a' 'b' 'c' 1 2 3 'd' 'e' 'f').
	resultCol := OrderedCollection new.
	testCol triplesDo: [ : a : b : c | resultCol add: a; add: b; add: c ].
	self assert: (resultCol hasEqualElements: testCol).
	
	testCol := #('a' 'b' 'c' 1 2).
	resultCol := OrderedCollection new.	
	testCol triplesDo: [ : a : b : c | resultCol add: a; add: b; add: c ].
	self assert: (resultCol hasEqualElements: #('a' 'b' 'c')).

	testCol := #('a' 'b' 'c' 1).
	resultCol := OrderedCollection new.	
	testCol triplesDo: [ : a : b : c | resultCol add: a; add: b; add: c ].
	self assert: (resultCol hasEqualElements: #('a' 'b' 'c')).
]
