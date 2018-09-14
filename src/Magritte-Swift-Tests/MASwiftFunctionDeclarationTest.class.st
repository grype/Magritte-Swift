Class {
	#name : #MASwiftFunctionDeclarationTest,
	#superclass : #MASwiftSourceTestCase,
	#category : #'Magritte-Swift-Tests'
}

{ #category : #tests }
MASwiftFunctionDeclarationTest >> testPrintSwiftOn [
	| declaration |

	declaration := MASwiftFunctionDeclaration new
		name: #foo;
		yourself.
	self assertDeclaration: declaration prints: 'func foo()'.

	declaration genericParameters: #(#String).
	self assertDeclaration: declaration prints: 'func foo<String>()'.

	declaration declarationModifiers: #(#private).
	self assertDeclaration: declaration prints: 'private func foo<String>()'.

	declaration
		signature:
			(MASwiftFunctionSignature new
				parameters:
					{#Int.
					(MASwiftType new
						name: #String;
						isOptional: true;
						yourself)};
				throws: true;
				result:
					(MASwiftType new
						name: #String;
						isOptional: true;
						yourself);
				yourself).
	self assertDeclaration: declaration prints: 'private func foo<String>(Int, String?) throws -> String?'
]
