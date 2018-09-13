Class {
	#name : #MASwiftFunctionResult,
	#superclass : #MASwiftSourceObject,
	#instVars : [
		'attributes',
		'type'
	],
	#category : #'Magritte-Swift-Source'
}

{ #category : #accessing }
MASwiftFunctionResult >> attributes [
	^ attributes
]

{ #category : #accessing }
MASwiftFunctionResult >> attributes: anObject [
	attributes := anObject
]

{ #category : #printing }
MASwiftFunctionResult >> printSwiftOn: aStream [
	attributes
		ifNotNil: [ :attrs | 
			attrs do: [ :each | each printSwiftOn: aStream ] separatedBy: [ aStream nextPut: Character space ].
			aStream nextPut: Character space ].
	type ifNotNil: [ :aType | aType printSwiftOn: aStream ]
]

{ #category : #accessing }
MASwiftFunctionResult >> type [
	^ type
]

{ #category : #accessing }
MASwiftFunctionResult >> type: anObject [
	type := anObject
]
