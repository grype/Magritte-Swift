Class {
	#name : #MASwiftVariableDeclaration,
	#superclass : #MASwiftAbstractVariableDeclaration,
	#category : #'Magritte-Swift-Source'
}

{ #category : #writing }
MASwiftVariableDeclaration >> printDeclarationKeywordOn: aStream [
	aStream nextPutAll: 'var'
]
