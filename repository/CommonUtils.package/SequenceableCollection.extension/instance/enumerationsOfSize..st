*CommonUtils
enumerationsOfSize: aSize

   | result |

   result := OrderedCollection new: aSize.
   self 
		enumerationsOfSize: aSize
		do: [ : each | result add: (each joinUsing: self class empty) ].
	^ result