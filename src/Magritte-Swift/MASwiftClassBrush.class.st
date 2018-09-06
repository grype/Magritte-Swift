Class {
	#name : #MASwiftClassBrush,
	#superclass : #MASwiftBrush,
	#instVars : [
		'name',
		'inherits'
	],
	#category : #'Magritte-Swift-Brushes'
}

{ #category : #private }
MASwiftClassBrush >> closeBrush [
	self document writeIndent; closeClass; cr
]

{ #category : #accessing }
MASwiftClassBrush >> inherits [
	^ inherits
]

{ #category : #accessing }
MASwiftClassBrush >> inherits: anObject [
	inherits := anObject
]

{ #category : #accessing }
MASwiftClassBrush >> name [
	^ name
]

{ #category : #accessing }
MASwiftClassBrush >> name: anObject [
	name := anObject
]

{ #category : #private }
MASwiftClassBrush >> openBrush [
	self document writeIndent; openClass: name inherits: inherits; cr
]
