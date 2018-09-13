Class {
	#name : #MASwiftFunctionResultTest,
	#superclass : #MASwiftSourceTestCase,
	#category : #'Magritte-Swift-Tests'
}

{ #category : #tests }
MASwiftFunctionResultTest >> testPrintSwiftOn [
	| declaration |

	declaration := MASwiftFunctionResult new
		type: #String;
		yourself.
	self assertDeclaration: declaration prints: 'String'.

	declaration := MASwiftFunctionResult new
		type:
			(MASwiftType new
				name: 'Array';
				genericParameters: #(#String);
				yourself);
		attributes: #(#inout);
		yourself.
	self assertDeclaration: declaration prints: 'inout Array<String>'
]
