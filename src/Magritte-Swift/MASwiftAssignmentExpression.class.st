Class {
	#name : #MASwiftAssignmentExpression,
	#superclass : #MASwiftExpression,
	#instVars : [
		'expression',
		'receiver'
	],
	#category : #'Magritte-Swift-Source'
}

{ #category : #accessing }
MASwiftAssignmentExpression >> expression [
	^ expression
]

{ #category : #accessing }
MASwiftAssignmentExpression >> expression: anObject [
	expression := anObject
]

{ #category : #printing }
MASwiftAssignmentExpression >> printSwiftOn: aStream [
	receiver printSwiftOn: aStream.
	aStream nextPutAll: ' = '.
	expression printSwiftOn: aStream
]

{ #category : #accessing }
MASwiftAssignmentExpression >> receiver [
	^ receiver
]

{ #category : #accessing }
MASwiftAssignmentExpression >> receiver: anObject [
	receiver := anObject
]
