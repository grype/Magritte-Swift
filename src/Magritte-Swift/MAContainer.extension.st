Extension { #name : #MAContainer }

{ #category : #'*Magritte-Swift' }
MAContainer >> swiftCodableChildren [
	^ self children select: #isSwiftCodable
]

{ #category : #'*Magritte-Swift' }
MAContainer >> swiftSerializableChildren [
	^ self children select: #isSwiftSerialized
]

{ #category : #'*Magritte-Swift' }
MAContainer >> swiftSerializableRequiredChildren [
	^ self children select: [ :each | each isSwiftSerialized and: [ each isRequired ] ]
]
