Class {
	#name : #MASwiftBrush,
	#superclass : #WABrush,
	#category : #'Magritte-Swift-Brushes'
}

{ #category : #private }
MASwiftBrush >> closeBrush [
	self subclassResponsibility
]

{ #category : #private }
MASwiftBrush >> document [
	^ canvas document
]

{ #category : #private }
MASwiftBrush >> openBrush [
	self subclassResponsibility
]

{ #category : #private }
MASwiftBrush >> with: anObject [
	self openBrush.
	anObject ifNotNil: [ :obj | super with: [ canvas render: anObject ] ].
	self closeBrush
]
