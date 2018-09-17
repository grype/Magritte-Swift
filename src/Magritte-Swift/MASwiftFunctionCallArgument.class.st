Class {
	#name : #MASwiftFunctionCallArgument,
	#superclass : #MASwiftSourceObject,
	#instVars : [
		'name',
		'expression'
	],
	#category : #'Magritte-Swift-Source'
}

{ #category : #'instance creation' }
MASwiftFunctionCallArgument class >> named: aString [
	^ self new
		name: aString;
		yourself
]

{ #category : #'instance creation' }
MASwiftFunctionCallArgument class >> named: aString expression: anExpression [
	^ self new
		name: aString;
		expression: anExpression;
		yourself
]

{ #category : #accessing }
MASwiftFunctionCallArgument >> expression [
	^ expression
]

{ #category : #accessing }
MASwiftFunctionCallArgument >> expression: anObject [
	expression := anObject
]

{ #category : #accessing }
MASwiftFunctionCallArgument >> name [
	^ name
]

{ #category : #accessing }
MASwiftFunctionCallArgument >> name: anObject [
	name := anObject
]

{ #category : #writing }
MASwiftFunctionCallArgument >> printSwiftOn: aStream [
	name printSwiftOn: aStream.
	aStream nextPutAll: ': '.
	expression printSwiftOn: aStream
]
