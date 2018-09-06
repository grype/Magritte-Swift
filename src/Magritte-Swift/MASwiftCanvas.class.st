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
MASwiftCanvas >> assignmentExpression: anAssignmentExpression [
	self document writeIndent; assignmentExpression: anAssignmentExpression; cr
]

{ #category : #public }
MASwiftCanvas >> class: aClassName inherits: aCollectionOfStrings with: aBlock [
	^ (self
		brush:
			(MASwiftClassBrush new
				name: aClassName;
				inherits: aCollectionOfStrings;
				yourself)) with: aBlock
]

{ #category : #public }
MASwiftCanvas >> closeClass [
	self document closeClass
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
MASwiftCanvas >> function: aFunctionDeclaration with: aBlock [
	^ (self
		brush:
			(MASwiftFunctionDeclarationBrush new
				functionDeclaration: aFunctionDeclaration;
				yourself)) with: aBlock
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
MASwiftCanvas >> literal: aString [
	self document literal: aString
]

{ #category : #private }
MASwiftCanvas >> nest: aBlock [
	self document indent; cr.
	super nest: aBlock.
	self document outdent.
]

{ #category : #public }
MASwiftCanvas >> openClass: aClassName inherits: aCollectionOfStrings [
	^ self
		brush:
			(MASwiftClassBrush new
				name: aClassName;
				inherits: aCollectionOfStrings;
				yourself)
]

{ #category : #public }
MASwiftCanvas >> openStruct: aStructName inherits: aCollectionOfStrings [
	^ self
		brush:
			(MASwiftStructBrush new
				name: aStructName;
				inherits: aCollectionOfStrings;
				yourself)
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

{ #category : #public }
MASwiftCanvas >> struct: aStructName inherits: aCollectionOfStrings with: aBlock [
	^ (self
		brush:
			(MASwiftStructBrush new
				name: aStructName;
				inherits: aCollectionOfStrings;
				yourself)) with: aBlock
]

{ #category : #public }
MASwiftCanvas >> varNamed: aVarName ofType: aTypeString isOptional: isOptional [
	^ self
		brush:
			(MASwiftVarBrush new
				name: aVarName;
				type: aTypeString;
				isOptional: isOptional;
				yourself)
]
