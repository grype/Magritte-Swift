Extension { #name : #Dictionary }

{ #category : #'*Magritte-Swift' }
Dictionary >> printSwiftOn: aStream [
	aStream nextPut: $[.
	self associations
		do: [ :assoc | 
			assoc key printSwiftOn: aStream.
			aStream nextPutAll: ': '.
			assoc value printSwiftOn: aStream ]
		separatedBy: [ aStream nextPutAll: ', ' ].
	aStream nextPut: $]
]

{ #category : #'*Magritte-Swift' }
Dictionary >> swiftOn: aRenderer [
	aRenderer dictionary: self
]
