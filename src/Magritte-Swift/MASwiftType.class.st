Class {
	#name : #MASwiftType,
	#superclass : #MASwiftSourceObject,
	#instVars : [
		'name',
		'isOptional',
		'isImplicitlyUnwrappedOptional'
	],
	#category : #'Magritte-Swift-Source'
}

{ #category : #initialization }
MASwiftType >> initialize [
	super initialize.
	isOptional := false.
	isImplicitlyUnwrappedOptional := false
]

{ #category : #accessing }
MASwiftType >> isImplicitlyUnwrappedOptional [
	^ isImplicitlyUnwrappedOptional
]

{ #category : #accessing }
MASwiftType >> isImplicitlyUnwrappedOptional: anObject [
	isImplicitlyUnwrappedOptional := anObject
]

{ #category : #accessing }
MASwiftType >> isOptional [
	^ isOptional
]

{ #category : #accessing }
MASwiftType >> isOptional: anObject [
	isOptional := anObject
]

{ #category : #accessing }
MASwiftType >> name [
	^ name
]

{ #category : #accessing }
MASwiftType >> name: anObject [
	name := anObject
]

{ #category : #writing }
MASwiftType >> writeOn: aStream [
	aStream nextPutAll: name.
	isImplicitlyUnwrappedOptional
		ifTrue: [ aStream nextPut: $! ]
		ifFalse: [ isOptional
				ifTrue: [ aStream nextPut: $? ] ]
]
