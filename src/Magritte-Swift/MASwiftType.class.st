Class {
	#name : #MASwiftType,
	#superclass : #MASwiftAbstractType,
	#instVars : [
		'name',
		'genericParameters'
	],
	#category : #'Magritte-Swift-Source'
}

{ #category : #'instance creation' }
MASwiftType class >> any [
	^ self named: 'Any'
]

{ #category : #'instance creation' }
MASwiftType class >> implicitlyUnwrappedOptionalNamed: aString [
	^ self new
		name: aString;
		isImplicitlyUnwrappedOptional: true;
		yourself
]

{ #category : #initialization }
MASwiftType class >> initialize [
	Smalltalk at: #SwiftInferredType put: nil
]

{ #category : #'instance creation' }
MASwiftType class >> named: aString [
	^ self new
		name: aString;
		yourself
]

{ #category : #'instance creation' }
MASwiftType class >> optionalNamed: aString [
	^ self new
		name: aString;
		isOptional: true;
		yourself
]

{ #category : #'instance creation' }
MASwiftType class >> self [
	^ self named: 'Self'
]

{ #category : #accessing }
MASwiftType >> genericParameters [
	^ genericParameters
]

{ #category : #accessing }
MASwiftType >> genericParameters: anObject [
	genericParameters := anObject
]

{ #category : #accessing }
MASwiftType >> name [
	^ name
]

{ #category : #accessing }
MASwiftType >> name: anObject [
	name := anObject
]

{ #category : #printing }
MASwiftType >> printSwiftOn: aStream [
	aStream nextPutAll: name.
	genericParameters
		ifNotNil: [ :val | 
			aStream nextPut: $<.
			val
				do: [ :each | each printSwiftOn: aStream ]
				separatedBy: [ aStream nextPutAll: ', ' ].
			aStream nextPut: $> ].
	self printOptionalOn: aStream
]
