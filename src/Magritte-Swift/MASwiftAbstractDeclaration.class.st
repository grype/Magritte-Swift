Class {
	#name : #MASwiftAbstractDeclaration,
	#superclass : #MASwiftSourceObject,
	#instVars : [
		'attributes'
	],
	#category : #'Magritte-Swift-Source'
}

{ #category : #accessing }
MASwiftAbstractDeclaration >> attributes [
	^ attributes
]

{ #category : #accessing }
MASwiftAbstractDeclaration >> attributes: anObject [
	attributes := anObject
]

{ #category : #testing }
MASwiftAbstractDeclaration >> hasSubexpressions [
	"Some declarations could have a body - e.g. classes, structs, enums, functions."
	^ false
]

{ #category : #printing }
MASwiftAbstractDeclaration >> printAttributesOn: aStream [
	attributes ifNil: [ ^ false ].
	attributes do: [ :each | each printSwiftOn: aStream ] separatedBy: [ aStream nextPut: Character space ].
	^ true
]
