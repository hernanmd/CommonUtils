*CommonUtils-Tests
testIsValidInstVarName

	self assert: 'abc' isValidInstVarName.
	self assert: 'a' isValidInstVarName.
	self assert: 'Abc' isValidInstVarName.	
	self deny: 'abc123' isValidInstVarName.
	self deny: 'ab_c' isValidInstVarName.
	self deny: '' isValidInstVarName.

