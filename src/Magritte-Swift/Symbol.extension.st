Extension { #name : #Symbol }

{ #category : #'*Magritte-Swift' }
Symbol >> printSwiftOn: aStream [
	aStream nextPutAll: self greaseString 
]
