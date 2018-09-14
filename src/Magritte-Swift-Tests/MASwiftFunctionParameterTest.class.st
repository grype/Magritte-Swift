Class {
	#name : #MASwiftFunctionParameterTest,
	#superclass : #MASwiftSourceTestCase,
	#category : #'Magritte-Swift-Tests'
}

{ #category : #tests }
MASwiftFunctionParameterTest >> testPrintSwiftOn [
	| declaration |

	declaration := MASwiftFunctionParameter new
		name: #foo;
		type: #String;
		yourself.
	self assertDeclaration: declaration prints: 'foo: String'.

	declaration
		type:
			(MASwiftType new
				name: #String;
				isOptional: true;
				yourself).
	self assertDeclaration: declaration prints: 'foo: String?'.

	declaration localName: 'aFoo'.
	self assertDeclaration: declaration prints: 'foo aFoo: String?'.

	declaration defaultValue: #nil.
	self assertDeclaration: declaration prints: 'foo aFoo: String? = nil'
]
