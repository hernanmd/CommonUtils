Extension { #name : #Collection }

{ #category : #'*CommonUtils' }
Collection >> asListString [
    "Return collection printed as 'a
b
c' "
    " #( 'a' 'b' 'c') asListString >>> 'a
b
c'
"
    ^ String streamContents: [:s | 
			self 
				asStringOn: s 
				delimiter: (String perform: self platformTerminator) ]
]
