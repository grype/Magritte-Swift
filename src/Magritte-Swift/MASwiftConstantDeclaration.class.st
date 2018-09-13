Class {
	#name : #MASwiftConstantDeclaration,
	#superclass : #MASwiftAbstractVariableDeclaration,
	#category : #'Magritte-Swift-Source'
}

{ #category : #writing }
MASwiftConstantDeclaration >> printDeclarationKeywordOn: aStream [
	aStream nextPutAll: 'let'
]
