Extension { #name : #Character }

{ #category : #'*Magritte-Swift' }
Character >> swiftOn: aRenderer [
	aRenderer string: (String with: self)
]
