*CommonUtils
isValidInstVarName
	" Answer <true> if the receiver is valid as instance variable name "

	self ifEmpty: [ ^ false ].
	^ self first isLetter and: [ self includesDigit not and: [ self includesSpecialCharacter not ] ]