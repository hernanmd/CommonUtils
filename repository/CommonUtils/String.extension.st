Extension { #name : #String }

{ #category : #'*CommonUtils' }
String >> includesDigit [
	" Answer whether the receiver includes a digit "

	^ self anySatisfy: #isDigit
]

{ #category : #'*CommonUtils' }
String >> includesSpecialCharacter [
	" Answer whether the receiver includes a non-alphabetic character or digit "
	
	| alphaNumerics |
	
	self ifEmpty: [ ^ false ].
	alphaNumerics := ($0 to: $9) , ($A to: $Z) , ($a to: $z).
	^ self anySatisfy: [ : c | (alphaNumerics includes: c) not ]
]

{ #category : #'*CommonUtils' }
String >> isValidInstVarName [
	" Answer <true> if the receiver is valid as instance variable name "

	self ifEmpty: [ ^ false ].
	^ self first isLetter and: [ self includesDigit not and: [ self includesSpecialCharacter not ] ]
]
