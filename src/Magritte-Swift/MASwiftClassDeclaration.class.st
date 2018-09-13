Class {
	#name : #MASwiftClassDeclaration,
	#superclass : #MASwiftAbstractStructDeclaration,
	#category : #'Magritte-Swift-Source'
}

{ #category : #writing }
MASwiftClassDeclaration >> printStructIdentifierOn: aStream [
	aStream nextPutAll: 'class'.
	^ true
]
