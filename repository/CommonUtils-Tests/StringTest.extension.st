Extension { #name : #StringTest }

{ #category : #'*CommonUtils-Tests' }
StringTest >> testIncludesDigit [

	self assert: 'abc123' includesDigit.
	self assert: '1' includesDigit.
	self assert: '.1' includesDigit.
	self deny: 'abc' includesDigit.
	self deny: '' includesDigit.

]

{ #category : #'*CommonUtils-Tests' }
StringTest >> testIncludesSpecialCharacter [

	self assert: 'abc_123' includesSpecialCharacter.
	self assert: '1.' includesSpecialCharacter.
	self deny: 'abc123' includesSpecialCharacter.	
	self deny: 'abc' includesSpecialCharacter.
	self deny: '' includesSpecialCharacter.


]

{ #category : #'*CommonUtils-Tests' }
StringTest >> testIsValidInstVarName [

	self assert: 'abc' isValidInstVarName.
	self assert: 'a' isValidInstVarName.
	self assert: 'Abc' isValidInstVarName.	
	self deny: 'abc123' isValidInstVarName.
	self deny: 'ab_c' isValidInstVarName.
	self deny: '' isValidInstVarName.


]
