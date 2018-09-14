Class {
	#name : #MASwiftAbstractStructDeclarationTest,
	#superclass : #MASwiftSourceTestCase,
	#category : #'Magritte-Swift-Tests'
}

{ #category : #tests }
MASwiftAbstractStructDeclarationTest >> testPrintSwiftOn [
	| declaration |
	declaration := MASwiftClassDeclaration new name: #Foo; yourself.
	self assertDeclaration: declaration prints: 'class Foo'
]
