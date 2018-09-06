Extension { #name : #Collection }

{ #category : #'*Magritte-Swift' }
Collection >> swiftOn: aRenderer [ 
	aRenderer array: [
		self do: [ :each |
			aRenderer value: each ] ]
]
