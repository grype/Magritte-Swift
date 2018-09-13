Class {
	#name : #MASwiftProtocolDeclaration,
	#superclass : #MASwiftAbstractStructDeclaration,
	#category : #'Magritte-Swift-Source'
}

{ #category : #writing }
MASwiftProtocolDeclaration >> printStructIdentifierOn: aStream [
	aStream nextPutAll: 'protocol'.
	^ true
]
