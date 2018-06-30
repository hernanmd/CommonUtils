*CommonUtils
platformTerminator
	" Answer a <Symbol> used as selector. Defaults to the current platform terminator "
	
	Smalltalk os isWindows 
		ifTrue: [ ^ #crlf ].
	Smalltalk os isUnix 
		ifTrue: [ ^ #lf ].
	^ #cr