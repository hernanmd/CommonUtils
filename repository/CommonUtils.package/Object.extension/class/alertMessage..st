*CommonUtils
alertMessage: aString
	" Open a modal message dialog displaying aString "
	" This should be in a SpecUIAddOns-Polymorph package "
	
	self flag: #toDo.
	^ UITheme builder alert: aString