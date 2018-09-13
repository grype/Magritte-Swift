Class {
	#name : #MASwiftDeclarationBrush,
	#superclass : #MASwiftBrush,
	#instVars : [
		'declaration'
	],
	#category : #'Magritte-Swift-Brushes'
}

{ #category : #private }
MASwiftDeclarationBrush >> closeBrush [
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
	self document
		writeIndent;
		openDeclaration: declaration
]
