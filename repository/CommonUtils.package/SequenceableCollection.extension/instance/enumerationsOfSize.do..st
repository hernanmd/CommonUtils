*CommonUtils
enumerationsOfSize: aSize do: aBlock
   | anArray |

   anArray := Array new: aSize.
   self enumerateWithSize: aSize subSize: aSize in: anArray do: [ : each | aBlock value: each ]