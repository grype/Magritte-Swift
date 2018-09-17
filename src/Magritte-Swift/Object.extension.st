Extension { #name : #Object }

{ #category : #'*Magritte-Swift' }
Object >> asSwiftExpression [
	
]

{ #category : #'*Magritte-Swift' }
Object >> isSwiftExpression [
	^ false
]

{ #category : #'*Magritte-Swift' }
Object >> printSwiftOn: aStream [
	aStream nextPutAll: self greaseString
]

{ #category : #'*Magritte-Swift' }
Object >> swiftOn: aRenderer [
	self error: 'Override #swiftOn: to make the receiver expressable as Swift code'
]
