Class {
	#name : #MASwiftFunctionType,
	#superclass : #MASwiftAbstractType,
	#instVars : [
		'attributes',
		'signature'
	],
	#category : #'Magritte-Swift-Source'
}

{ #category : #accessing }
MASwiftFunctionType >> attributes [
	^ attributes
]

{ #category : #accessing }
MASwiftFunctionType >> attributes: anObject [
	attributes := anObject
]

{ #category : #writing }
MASwiftFunctionType >> printSwiftOn: aStream [
	| hasOptional |

	hasOptional := self isOptional or: [ self isImplicitlyUnwrappedOptional ].
	hasOptional
		ifTrue: [ aStream nextPut: $( ].
	attributes
		ifNotNil: [ :attrs | 
			attrs do: [ :each | each printSwiftOn: aStream ] separatedBy: [ aStream nextPut: Character space ].
			aStream nextPut: Character space ].

	signature printSwiftOn: aStream.
	signature result ifNil: [ aStream nextPutAll: ' -> Void' ].
	hasOptional
		ifTrue: [ aStream nextPut: $) ].
	self printOptionalOn: aStream
]

{ #category : #accessing }
MASwiftFunctionType >> signature [
	^ signature
]

{ #category : #accessing }
MASwiftFunctionType >> signature: anObject [
	signature := anObject
]
