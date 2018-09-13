Class {
	#name : #MASwiftImportDeclarationTest,
	#superclass : #MASwiftSourceTestCase,
	#category : #'Magritte-Swift-Tests'
}

{ #category : #tests }
MASwiftImportDeclarationTest >> testPrintSwiftOn [
	| declaration |

	declaration := MASwiftImportDeclaration new
		name: 'Foo';
		yourself.
	self assertDeclaration: declaration prints: 'import Foo'.

	declaration kind: 'typealias'.
	self assertDeclaration: declaration prints: 'import typealias Foo'.

	declaration attributes: {(MASwiftAttribute named: 'objc')}.
	self assertDeclaration: declaration prints: '@objc import typealias Foo'.
	
	declaration moduleName: 'Module'.
	self assertDeclaration: declaration prints: '@objc import typealias Module.Foo'.
]
