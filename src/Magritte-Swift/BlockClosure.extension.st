Extension { #name : #BlockClosure }

{ #category : #'*Magritte-Swift' }
BlockClosure >> swiftOn: aRenderer [
	self numArgs = 0
		ifTrue: [ self value ]
		ifFalse: [ self value: aRenderer ]
]
