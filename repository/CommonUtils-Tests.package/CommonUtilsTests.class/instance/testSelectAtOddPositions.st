testing
testSelectAtOddPositions

	self assert: #('a' 1 2 'b' 'c' 'd') selectAtOddPositions equals: #('a' 2 'c') 