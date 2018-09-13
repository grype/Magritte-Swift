Class {
	#name : #MASwiftAbstractType,
	#superclass : #MASwiftSourceObject,
	#instVars : [
		'isOptional',
		'isImplicitlyUnwrappedOptional'
	],
	#category : #'Magritte-Swift-Source'
}

{ #category : #initialization }
MASwiftAbstractType >> initialize [
	super initialize.
	isOptional := false.
	isImplicitlyUnwrappedOptional := false
]

{ #category : #accessing }
MASwiftAbstractType >> isImplicitlyUnwrappedOptional [
	^ isImplicitlyUnwrappedOptional
]

{ #category : #accessing }
MASwiftAbstractType >> isImplicitlyUnwrappedOptional: anObject [
	isImplicitlyUnwrappedOptional := anObject
]

{ #category : #accessing }
MASwiftAbstractType >> isOptional [
	^ isOptional
]

{ #category : #accessing }
MASwiftAbstractType >> isOptional: anObject [
	isOptional := anObject
]

{ #category : #printing }
MASwiftAbstractType >> printOptionalOn: aStream [
	isImplicitlyUnwrappedOptional
		ifTrue: [ aStream nextPut: $! ]
		ifFalse: [ isOptional
				ifTrue: [ aStream nextPut: $? ] ]
]
