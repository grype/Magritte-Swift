Class {
	#name : #MASwiftInitDeclaration,
	#superclass : #MASwiftAbstractFunctionDeclaration,
	#category : #'Magritte-Swift-Source'
}

{ #category : #writing }
MASwiftInitDeclaration >> writeFunctionIdentifier: aStream [
	aStream nextPutAll: 'init'
]
