Class {
	#name : #MASwiftEnumDeclaration,
	#superclass : #MASwiftAbstractStructDeclaration,
	#category : #'Magritte-Swift-Source'
}

{ #category : #writing }
MASwiftEnumDeclaration >> printStructIdentifierOn: aStream [
	aStream nextPutAll: 'enum'.
	^ true
]
