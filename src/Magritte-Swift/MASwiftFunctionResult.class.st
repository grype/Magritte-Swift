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

{ #category : #accessing }
MASwiftFunctionResult >> type [
	^ type
]

{ #category : #accessing }
MASwiftFunctionResult >> type: anObject [
	type := anObject
]

{ #category : #writing }
MASwiftFunctionResult >> writeOn: aStream [
	attributes
		ifNotNil: [ :attrs | attrs do: [ :each | each writeOn: aStream ] separatedBy: [ aStream nextPut: Character space ] ].
	type ifNotNil: [ :aType | aType writeOn: aStream ]
]
