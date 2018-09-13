Class {
	#name : #MASwiftTypeTest,
	#superclass : #MASwiftSourceTestCase,
	#category : #'Magritte-Swift-Tests'
}

{ #category : #tests }
MASwiftTypeTest >> testPrintSwiftOn [
	| declaration |

	declaration := MASwiftType new
		name: #Foo;
		yourself.
	self assertDeclaration: declaration prints: 'Foo'.

	declaration isOptional: true.
	self assertDeclaration: declaration prints: 'Foo?'.

	declaration isImplicitlyUnwrappedOptional: true.
	self assertDeclaration: declaration prints: 'Foo!'.
	
	declaration genericParameters: #(#Bar #Baz).
	self assertDeclaration: declaration prints: 'Foo<Bar, Baz>!'
]
