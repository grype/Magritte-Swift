Class {
	#name : #MASwiftStructDeclaration,
	#superclass : #MASwiftAbstractStructDeclaration,
	#category : #'Magritte-Swift-Source'
}

{ #category : #writing }
MASwiftStructDeclaration >> printStructIdentifierOn: aStream [
	aStream nextPutAll: 'struct'.
	^ true
]
