*CommonUtils
includesSpecialCharacter
	" Answer whether the receiver includes a non-alphabetic character or digit "

	^ (self includesAnyOf: ($0 to: $9) , ($A to: $Z) , ($a to: $z)) not