Class {
	#name : #MASwiftTupleType,
	#superclass : #MASwiftAbstractType,
	#instVars : [
		'types'
	],
	#category : #'Magritte-Swift-Source'
}

{ #category : #writing }
MASwiftTupleType >> printSwiftOn: aStream [
	aStream nextPut: $(.
	types do: [ :each | each printSwiftOn: aStream ] separatedBy: [ aStream nextPutAll: ', ' ].
	aStream nextPut: $).
	self printOptionalOn: aStream
]

{ #category : #accessing }
MASwiftTupleType >> types [
	^ types
]

{ #category : #accessing }
MASwiftTupleType >> types: anObject [
	types := anObject
]
