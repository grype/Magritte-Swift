Class {
	#name : #MASwiftEnumBrush,
	#superclass : #MASwiftClassBrush,
	#category : #'Magritte-Swift-Brushes'
}

{ #category : #private }
MASwiftEnumBrush >> openBrush [
	self document writeIndent; openEnum: name inherits: inherits; cr
]
