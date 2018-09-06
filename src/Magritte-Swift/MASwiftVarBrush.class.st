Class {
	#name : #MASwiftVarBrush,
	#superclass : #MASwiftBrush,
	#instVars : [
		'name',
		'type',
		'isOptional'
	],
	#category : #'Magritte-Swift-Brushes'
}

{ #category : #private }
MASwiftVarBrush >> closeBrush [
	self document cr
]

{ #category : #initialization }
MASwiftVarBrush >> initialize [
	super initialize.
	isOptional := false
]

{ #category : #accessing }
MASwiftVarBrush >> isOptional [
	^ isOptional
]

{ #category : #accessing }
MASwiftVarBrush >> isOptional: anObject [
	isOptional := anObject
]

{ #category : #accessing }
MASwiftVarBrush >> name [
	^ name
]

{ #category : #accessing }
MASwiftVarBrush >> name: anObject [
	name := anObject
]

{ #category : #private }
MASwiftVarBrush >> openBrush [
	self document writeIndent; varNamed: name ofType: type isOptional: isOptional 
]

{ #category : #accessing }
MASwiftVarBrush >> type [
	^ type
]

{ #category : #accessing }
MASwiftVarBrush >> type: anObject [
	type := anObject
]
