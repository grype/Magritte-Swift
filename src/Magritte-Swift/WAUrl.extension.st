Extension { #name : #WAUrl }

{ #category : #'*Magritte-Swift' }
WAUrl >> printSwiftOn: aStream [
	aStream nextPutAll: 'URL(string: '.
	self printString printSwiftOn: aStream.
	aStream nextPut: $)
]

{ #category : #'*Magritte-Swift' }
WAUrl >> swiftOn: aRenderer [
	aRenderer url: self
]
