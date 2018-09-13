Class {
	#name : #MASwiftArrayType,
	#superclass : #MASwiftAbstractType,
	#instVars : [
		'elementType'
	],
	#category : #'Magritte-Swift-Source'
}

{ #category : #accessing }
MASwiftArrayType >> elementType [
	^ elementType
]

{ #category : #accessing }
MASwiftArrayType >> elementType: anObject [
	elementType := anObject
]

{ #category : #printing }
MASwiftArrayType >> printSwiftOn: aStream [
	aStream nextPut: $[.
	elementType printSwiftOn: aStream.
	aStream nextPut: $].
	self printOptionalOn: aStream
]
