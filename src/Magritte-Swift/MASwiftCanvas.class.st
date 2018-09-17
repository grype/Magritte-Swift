Class {
	#name : #MASwiftCanvas,
	#superclass : #WACanvas,
	#category : #'Magritte-Swift-Core'
}

{ #category : #'instance creation' }
MASwiftCanvas class >> builder [
	^ (WABuilder on: self)
		documentClass: MASwiftDocument;
		yourself
]

{ #category : #public }
MASwiftCanvas >> array: anArray [
	self document array: anArray
]

{ #category : #public }
MASwiftCanvas >> contents [
	^ self document stream contents
]

{ #category : #public }
MASwiftCanvas >> cr [
	self flush.
	self document cr
]

{ #category : #public }
MASwiftCanvas >> dateAndTime: aDateAndTime [
	self document dateAndTime: aDateAndTime
]

{ #category : #public }
MASwiftCanvas >> declaration: aDeclaration [
	^ self
		brush:
			(MASwiftDeclarationBrush new
				declaration: aDeclaration;
				yourself)
]

{ #category : #public }
MASwiftCanvas >> declaration: aDeclaration with: aBlock [
	^ (self
		brush:
			(MASwiftDeclarationBrush new
				declaration: aDeclaration;
				yourself)) with: aBlock
]

{ #category : #public }
MASwiftCanvas >> dictionary: aDictionary [
	self document dictionary: aDictionary
]

{ #category : #public }
MASwiftCanvas >> expression: anAssignmentExpression [
	self document writeIndent; expression: anAssignmentExpression.
]

{ #category : #public }
MASwiftCanvas >> import: aString [
	^ self
		brush:
			(MASwiftImportBrush new
				name: aString;
				yourself)
]

{ #category : #public }
MASwiftCanvas >> literal: anObject [
	self document literal: anObject
]

{ #category : #private }
MASwiftCanvas >> nest: aBlock [
	self document indent; cr.
	super nest: aBlock.
	self document outdent; cr.
]

{ #category : #public }
MASwiftCanvas >> number: aNumber [
	self document number: aNumber
]

{ #category : #public }
MASwiftCanvas >> render: anObject [
	self flush.
	anObject swiftOn: self
]

{ #category : #public }
MASwiftCanvas >> string: aString [
	self document string: aString
]
