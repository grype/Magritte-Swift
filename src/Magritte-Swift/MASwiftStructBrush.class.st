Class {
	#name : #MASwiftStructBrush,
	#superclass : #MASwiftClassBrush,
	#category : #'Magritte-Swift-Brushes'
}

{ #category : #private }
MASwiftStructBrush >> openBrush [
	self document writeIndent; openStruct: name inherits: inherits; cr
]
