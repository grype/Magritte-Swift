Extension { #name : #UndefinedObject }

{ #category : #'*Magritte-Swift' }
UndefinedObject >> printSwiftOn: aStream [
	aStream nextPutAll: 'nil'
]

{ #category : #'*Magritte-Swift' }
UndefinedObject >> swiftOn: aRenderer [
	aRenderer literal: #nil
]
