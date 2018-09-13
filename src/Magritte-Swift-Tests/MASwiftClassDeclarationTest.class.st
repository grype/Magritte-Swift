Class {
	#name : #MASwiftClassDeclarationTest,
	#superclass : #MASwiftSourceTestCase,
	#category : #'Magritte-Swift-Tests'
}

{ #category : #tests }
MASwiftClassDeclarationTest >> testPrintSwiftOn [
	| declaration |
	declaration := MASwiftClassDeclaration new name: #Foo; yourself.
	self assertDeclaration: declaration prints: 'class Foo'
]
