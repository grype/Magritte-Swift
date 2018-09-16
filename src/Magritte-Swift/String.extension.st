Extension { #name : #String }

{ #category : #'*Magritte-Swift' }
String >> printSwiftOn: aStream [
	aStream nextPut: $"; nextPutAll: (self copyReplaceAll: '"' with: '\"'); nextPut: $"
]

{ #category : #'*Magritte-Swift' }
String >> swiftOn: aRenderer [
	aRenderer string: self
]
