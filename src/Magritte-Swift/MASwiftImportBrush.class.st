Class {
	#name : #MASwiftImportBrush,
	#superclass : #MASwiftBrush,
	#instVars : [
		'name'
	],
	#category : #'Magritte-Swift-Brushes'
}

{ #category : #private }
MASwiftImportBrush >> closeBrush [
	self document lf
]

{ #category : #accessing }
MASwiftImportBrush >> name [
	^ name
]

{ #category : #accessing }
MASwiftImportBrush >> name: anObject [
	name := anObject
]

{ #category : #private }
MASwiftImportBrush >> openBrush [
	self document import: name
]
