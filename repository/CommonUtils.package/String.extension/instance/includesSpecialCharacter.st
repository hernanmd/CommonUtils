*CommonUtils
includesSpecialCharacter
	" Answer whether the receiver includes a non-alphabetic character or digit "
	
	| alphaNumerics |
	
	self ifEmpty: [ ^ false ].
	alphaNumerics := ($0 to: $9) , ($A to: $Z) , ($a to: $z).
	^ self anySatisfy: [ : c | (alphaNumerics includes: c) not ]