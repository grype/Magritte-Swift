Class {
	#name : #MASwiftFunctionDeclarationBrush,
	#superclass : #MASwiftBrush,
	#instVars : [
		'functionDeclaration'
	],
	#category : #'Magritte-Swift-Brushes'
}

{ #category : #private }
MASwiftFunctionDeclarationBrush >> closeBrush [
	self document writeIndent; closeFunctionDeclaration; cr
]

{ #category : #accessing }
MASwiftFunctionDeclarationBrush >> functionDeclaration [
	^ functionDeclaration
]

{ #category : #accessing }
MASwiftFunctionDeclarationBrush >> functionDeclaration: anObject [
	functionDeclaration := anObject
]

{ #category : #private }
MASwiftFunctionDeclarationBrush >> openBrush [
	self document writeIndent; openFunctionDeclaration: functionDeclaration
]
