Class {
	#name : #MASwiftAbstractVariableDeclaration,
	#superclass : #MASwiftAbstractDeclaration,
	#instVars : [
		'declarationModifiers',
		'name',
		'type',
		'initializingExpression'
	],
	#category : #'Magritte-Swift-Source'
}

{ #category : #accessing }
MASwiftAbstractVariableDeclaration >> declarationModifiers [
	^ declarationModifiers
]

{ #category : #accessing }
MASwiftAbstractVariableDeclaration >> declarationModifiers: anObject [
	declarationModifiers := anObject
]

{ #category : #accessing }
MASwiftAbstractVariableDeclaration >> initializingExpression [
	^ initializingExpression
]

{ #category : #accessing }
MASwiftAbstractVariableDeclaration >> initializingExpression: anObject [
	initializingExpression := anObject
]

{ #category : #accessing }
MASwiftAbstractVariableDeclaration >> name [
	^ name
]

{ #category : #accessing }
MASwiftAbstractVariableDeclaration >> name: anObject [
	name := anObject
]

{ #category : #writing }
MASwiftAbstractVariableDeclaration >> printDeclarationKeywordOn: aStream [
	aStream nextPutAll: 'let '
]

{ #category : #writing }
MASwiftAbstractVariableDeclaration >> printSwiftOn: aStream [
	(self printAttributesOn: aStream)
		ifTrue: [ aStream nextPut: Character space ].
	self printDeclarationKeywordOn: aStream.
	aStream nextPut: Character space.
	name printSwiftOn: aStream.
	type
		ifNotNil: [ :val | 
			aStream nextPutAll: ': '.
			val printSwiftOn: aStream ].
	initializingExpression
		ifNotNil: [ :val | 
			aStream nextPutAll: ' = '.
			val printSwiftOn: aStream ]
]

{ #category : #accessing }
MASwiftAbstractVariableDeclaration >> type [
	^ type
]

{ #category : #accessing }
MASwiftAbstractVariableDeclaration >> type: anObject [
	type := anObject
]
