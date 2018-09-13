Class {
	#name : #MASwiftFunctionDeclaration,
	#superclass : #MASwiftAbstractFunctionDeclaration,
	#instVars : [
		'name'
	],
	#category : #'Magritte-Swift-Source'
}

{ #category : #accessing }
MASwiftFunctionDeclaration >> name [
	^ name
]

{ #category : #accessing }
MASwiftFunctionDeclaration >> name: anObject [
	name := anObject
]

{ #category : #printing }
MASwiftFunctionDeclaration >> printFunctionIdentifier: aStream [
	aStream
		nextPutAll: 'func ';
		nextPutAll: name.
	^ true
]
