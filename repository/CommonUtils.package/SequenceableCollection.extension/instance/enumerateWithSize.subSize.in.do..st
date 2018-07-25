*CommonUtils
enumerateWithSize: aSize subSize: sSize in: anArray do: aBlock

    aSize < sSize
        ifTrue: [ ^self error: 'subSize cannot exceed array size' ].
    sSize < 1
        ifTrue: [ ^self error: 'sizes must be positive' ].
    sSize = 1
        ifTrue: [
            self do: [ :each |
                aBlock value: (anArray at: aSize - sSize + 1 put: each ; yourself) ] ]
        ifFalse: [
            self do: [ :each |
                self enumerateWithSize: aSize subSize: sSize - 1 in: anArray do: [ :eachArray |
                    aBlock value: (eachArray at: aSize - sSize + 1 put: each ; yourself) ] ] ]