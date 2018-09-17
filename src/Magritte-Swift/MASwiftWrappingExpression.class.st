Class {
	#name : #MASwiftWrappingExpression,
	#superclass : #MASwiftAbstractExpression,
	#instVars : [
		'expression'
	],
	#category : #'Magritte-Swift-Source'
}

{ #category : #'instance-creation' }
MASwiftWrappingExpression class >> with: anObject [
	^ self new expression: anObject
]

{ #category : #accessing }
MASwiftWrappingExpression >> expression [
	^ expression
]

{ #category : #accessing }
MASwiftWrappingExpression >> expression: anObject [
	expression := anObject
]

{ #category : #writing }
MASwiftWrappingExpression >> printSwiftOn: aStream [
	aStream nextPutAll: '( '.
	self expression printSwiftOn: aStream.
	aStream nextPutAll: ' )'
]
