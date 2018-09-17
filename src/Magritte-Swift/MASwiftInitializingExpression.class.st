Class {
	#name : #MASwiftInitializingExpression,
	#superclass : #MASwiftAbstractExpression,
	#instVars : [
		'arguments',
		'type'
	],
	#category : #'Magritte-Swift-Source'
}

{ #category : #accessing }
MASwiftInitializingExpression >> arguments [
	^ arguments
]

{ #category : #accessing }
MASwiftInitializingExpression >> arguments: anObject [
	arguments := anObject
]

{ #category : #initialization }
MASwiftInitializingExpression >> initialize [
	super initialize.
	arguments := OrderedCollection new
]

{ #category : #writing }
MASwiftInitializingExpression >> printSwiftOn: aStream [
	self type printSwiftOn: aStream.
	aStream nextPut: $(.
	self arguments do: [ :each | each printSwiftOn: aStream ] separatedBy: [ aStream nextPutAll: ', ' ].
	aStream nextPut: $)
]

{ #category : #accessing }
MASwiftInitializingExpression >> type [
	^ type
]

{ #category : #accessing }
MASwiftInitializingExpression >> type: anObject [
	type := anObject
]
