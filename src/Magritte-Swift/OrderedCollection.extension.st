Extension { #name : #OrderedCollection }

{ #category : #'*Magritte-Swift' }
OrderedCollection >> printSwiftOn: aStream [
	aStream nextPut: $[.
	self
		do: [ :each | each printSwiftOn: aStream ]
		separatedBy: [ aStream nextPutAll: ', ' ].
	aStream nextPut: $]
]

{ #category : #'*Magritte-Swift' }
OrderedCollection >> swiftOn: aRenderer [
	aRenderer array: self
]
