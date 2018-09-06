Extension { #name : #WAUrl }

{ #category : #'*Magritte-Swift' }
WAUrl >> swiftOn: aRenderer [
	aRenderer string: self printString
]
