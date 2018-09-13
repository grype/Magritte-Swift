Class {
	#name : #MASwiftFunctionTypeTest,
	#superclass : #MASwiftSourceTestCase,
	#category : #'Magritte-Swift-Tests'
}

{ #category : #tests }
MASwiftFunctionTypeTest >> testPrintSwiftOn [
	| declaration |

	declaration := MASwiftFunctionType new
		signature:
			(MASwiftFunctionSignature new
				parameters:
					{#Int.
					(MASwiftType new
						name: #Array;
						genericParameters: #(#String);
						yourself)};
				result:
					(MASwiftArrayType new
						elementType: #String;
						isOptional: true;
						yourself);
				yourself);
		yourself.
	self assertDeclaration: declaration prints: '(Int, Array<String>) -> [String]?'.
	
	declaration isOptional: true.
	self assertDeclaration: declaration prints: '((Int, Array<String>) -> [String]?)?'.
]
