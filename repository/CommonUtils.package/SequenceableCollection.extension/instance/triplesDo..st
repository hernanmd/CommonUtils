*CommonUtils
triplesDo:aBlock
    " Assume receiver with 3-element triples. The block is called with 3 arguments for each collection in the receiver. If there's an odd number of items, ignore the last one(s). "

	1 to: self size // 3 do: [ :index |
         aBlock 
			value: (self at: 3 * index - 2) 
			value: (self at: 3 * index - 1)
			value: (self at: 3 * index) ]