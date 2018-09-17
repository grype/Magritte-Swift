Class {
	#name : #MASwiftCastingExpression,
	#superclass : #MASwiftAbstractExpression,
	#instVars : [
		'type',
		'isOptional',
		'isImplicitlyUnwrappedOptional',
		'expression'
	],
	#category : #'Magritte-Swift-Source'
}

{ #category : #'instance-creation' }
MASwiftCastingExpression class >> with: anObject as: aType [
	^ self new
		expression: anObject;
		type: aType;
		yourself
]

{ #category : #accessing }
MASwiftCastingExpression >> expression [
	^ expression
]

{ #category : #accessing }
MASwiftCastingExpression >> expression: anObject [
	expression := anObject
]

{ #category : #initialization }
MASwiftCastingExpression >> initialize [
	super initialize.
	isOptional := false.
	isImplicitlyUnwrappedOptional := false
]

{ #category : #accessing }
MASwiftCastingExpression >> isImplicitlyUnwrappedOptional [
	^ isImplicitlyUnwrappedOptional
]

{ #category : #accessing }
MASwiftCastingExpression >> isImplicitlyUnwrappedOptional: anObject [
	isImplicitlyUnwrappedOptional := anObject
]

{ #category : #accessing }
MASwiftCastingExpression >> isOptional [
	^ isOptional
]

{ #category : #accessing }
MASwiftCastingExpression >> isOptional: anObject [
	isOptional := anObject
]

{ #category : #writing }
MASwiftCastingExpression >> printSwiftOn: aStream [
	self expression printSwiftOn: aStream.
	aStream nextPutAll: ' as'.
	self isImplicitlyUnwrappedOptional
		ifTrue: [ aStream nextPut: $! ].
	self isOptional
		ifTrue: [ aStream nextPut: $? ].
	aStream nextPut: Character space.
	self type printSwiftOn: aStream
]

{ #category : #accessing }
MASwiftCastingExpression >> type [
	^ type
]

{ #category : #accessing }
MASwiftCastingExpression >> type: anObject [
	type := anObject
]
