Class {
	#name : #MASwiftInitDeclaration,
	#superclass : #MASwiftAbstractFunctionDeclaration,
	#category : #'Magritte-Swift-Source'
}

{ #category : #printing }
MASwiftInitDeclaration >> printFunctionIdentifier: aStream [
	aStream nextPutAll: 'init'.
	^ true
]
