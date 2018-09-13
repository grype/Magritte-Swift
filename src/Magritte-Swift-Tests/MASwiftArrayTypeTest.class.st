Class {
	#name : #MASwiftArrayTypeTest,
	#superclass : #MASwiftSourceTestCase,
	#category : #'Magritte-Swift-Tests'
}

{ #category : #tests }
MASwiftArrayTypeTest >> testPrintSwiftOn [
	| declaration |

	declaration := MASwiftArrayType new
		elementType: #Foo;
		yourself.
	self assertDeclaration: declaration prints: '[Foo]'
]
