Class {
	#name : #MASwiftDeclarationBrush,
	#superclass : #MASwiftBrush,
	#instVars : [
		'declaration',
		'nestedObject'
	],
	#category : #'Magritte-Swift-Brushes'
}

{ #category : #private }
MASwiftDeclarationBrush >> closeBrush [
	nestedObject ifNil: [ ^ self ].
	self document
		writeIndent;
		closeDeclaration
]

{ #category : #accessing }
MASwiftDeclarationBrush >> declaration [
	^ declaration
]

{ #category : #accessing }
MASwiftDeclarationBrush >> declaration: anObject [
	declaration := anObject
]

{ #category : #private }
MASwiftDeclarationBrush >> openBrush [
	self document writeIndent.
	nestedObject
		ifNil: [ self document declaration: declaration ]
		ifNotNil: [ self document openDeclaration: declaration ]
]

{ #category : #private }
MASwiftDeclarationBrush >> with: anObject [
	nestedObject := anObject.
	super with: anObject
]
