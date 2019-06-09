*CommonUtils-Tests
testIncludesSpecialCharacter

	self assert: 'abc_123' includesSpecialCharacter.
	self assert: '1.' includesSpecialCharacter.
	self deny: 'abc123' includesSpecialCharacter.	
	self deny: 'abc' includesSpecialCharacter.
	self deny: '' includesSpecialCharacter.

