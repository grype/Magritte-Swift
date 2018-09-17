Extension { #name : #Number }

{ #category : #'*Magritte-Swift' }
Number >> printSwiftOn: aStream [
	aStream nextPutAll: self greaseString 
]

{ #category : #'*Magritte-Swift' }
Number >> swiftOn: aRenderer [
	aRenderer number: self
]
