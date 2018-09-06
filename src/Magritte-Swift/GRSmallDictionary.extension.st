Extension { #name : #GRSmallDictionary }

{ #category : #'*Magritte-Swift' }
GRSmallDictionary >> swiftOn: aRenderer [
	aRenderer dictionary: [
		self keysAndValuesDo: [ :key :value |
			aRenderer key: key value: value ] ]
]
