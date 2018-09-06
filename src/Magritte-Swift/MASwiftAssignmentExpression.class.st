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

{ #category : #accessing }
MASwiftAssignmentExpression >> receiver [
	^ receiver
]

{ #category : #accessing }
MASwiftAssignmentExpression >> receiver: anObject [
	receiver := anObject
]

{ #category : #writing }
MASwiftAssignmentExpression >> writeOn: aStream [
	(receiver isKindOf: MASwiftSourceObject)
		ifTrue: [ receiver writeOn: aStream ]
		ifFalse: [ aStream nextPutAll: receiver greaseString ].
	aStream nextPutAll: ' = '.
	(expression isKindOf: MASwiftSourceObject)
		ifTrue: [ expression writeOn: aStream ]
		ifFalse: [ aStream nextPutAll: expression greaseString ]
]
