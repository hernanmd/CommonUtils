*CommonUtils
tripleDo: aBlock
    " Assume receiver with 3-element triples. The block is called with 3 arguments for each 3 elements in the receiver, stepping by one. If there's an odd number of items, ignore the last one(s). "

	1 to: self size - 2 do: [ :index |
		aBlock 
			value: (self at: index) 
			value: (self at: index + 1)
			value: (self at: index + 2) ]