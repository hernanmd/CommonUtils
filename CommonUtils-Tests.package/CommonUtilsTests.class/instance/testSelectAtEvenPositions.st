testing
testSelectAtEvenPositions

	self assert: #('a' 1 2 'b' 'c' 'd') selectAtEvenPositions equals: #(1 'b' 'd')