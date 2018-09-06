Extension { #name : #Dictionary }

{ #category : #'*Magritte-Swift' }
Dictionary >> swiftOn: aRenderer [
	aRenderer dictionary: [
		self keysAndValuesDo: [ :key :value |
			aRenderer key: key value: value ] ]
]
