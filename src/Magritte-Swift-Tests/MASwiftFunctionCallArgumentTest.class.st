Class {
	#name : #MASwiftFunctionCallArgumentTest,
	#superclass : #MASwiftSourceTestCase,
	#category : #'Magritte-Swift-Tests'
}

{ #category : #tests }
MASwiftFunctionCallArgumentTest >> testPrintSwiftOn [
	| declaration |

	declaration := MASwiftFunctionCallArgument new
		name: #foo;
		yourself.
	self assertDeclaration: declaration prints: 'foo: nil'.

	declaration expression: ''.
	self assertDeclaration: declaration prints: 'foo: ""'.

	declaration expression: 10.
	self assertDeclaration: declaration prints: 'foo: 10'.

	declaration
		expression:
			(MASwiftCastingExpression new
				expression: {('foo' -> 'Foo')} asDictionary;
				type: {(#Any -> #Any)} asDictionary;
				yourself).
	self assertDeclaration: declaration prints: 'foo: ["foo": "Foo"] as [Any: Any]'
]
