*CommonUtils-Tests
testIncludesDigit

	self assert: 'abc123' includesDigit.
	self assert: '1' includesDigit.
	self assert: '.1' includesDigit.
	self deny: 'abc' includesDigit.
	self deny: '' includesDigit.
