Class {
	#name : #MASwiftInitDeclarationTest,
	#superclass : #MASwiftSourceTestCase,
	#category : #'Magritte-Swift-Tests'
}

{ #category : #tests }
MASwiftInitDeclarationTest >> testPrintSwiftOn [
	| declaration |

	declaration := MASwiftInitDeclaration new.
	self assertDeclaration: declaration prints: 'init()'.

	declaration genericParameters: #(#String).
	self assertDeclaration: declaration prints: 'init<String>()'.

	declaration declarationModifiers: #(#convenience).
	self assertDeclaration: declaration prints: 'convenience init<String>()'.

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
	self assertDeclaration: declaration prints: 'convenience init<String>(Int, String?) throws -> String?'
]
