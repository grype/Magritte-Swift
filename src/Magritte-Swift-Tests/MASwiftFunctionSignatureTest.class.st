Class {
	#name : #MASwiftFunctionSignatureTest,
	#superclass : #MASwiftSourceTestCase,
	#category : #'Magritte-Swift-Tests'
}

{ #category : #tests }
MASwiftFunctionSignatureTest >> testPrintSwiftOn [
	| declaration |

	declaration := MASwiftFunctionSignature new.
	self assertDeclaration: declaration prints: '()'.
	
	declaration throws: true.
	self assertDeclaration: declaration prints: '() throws'.

	declaration result: #String.
	self assertDeclaration: declaration prints: '() throws -> String'.

	declaration
		result:
			(MASwiftFunctionResult new
				attributes: #(#ourAttribute);
				type:
					(MASwiftFunctionType new
						signature:
							(MASwiftFunctionSignature new
								parameters: #(#Int #String);
								yourself);
						yourself);
				yourself).
	self assertDeclaration: declaration prints: '() throws -> ourAttribute (Int, String) -> Void'
]
