Class {
	#name : #MASwiftReturnExpression,
	#superclass : #MASwiftAbstractExpression,
	#instVars : [
		'expression'
	],
	#category : #'Magritte-Swift-Source'
}

{ #category : #accessing }
MASwiftReturnExpression >> expression [
	^ expression
]

{ #category : #accessing }
MASwiftReturnExpression >> expression: anObject [
	expression := anObject
]

{ #category : #writing }
MASwiftReturnExpression >> printSwiftOn: aStream [
	aStream nextPutAll: 'return '.
	expression printSwiftOn: aStream
]
