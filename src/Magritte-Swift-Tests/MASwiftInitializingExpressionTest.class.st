Class {
	#name : #MASwiftInitializingExpressionTest,
	#superclass : #MASwiftSourceTestCase,
	#category : #'Magritte-Swift-Tests'
}

{ #category : #tests }
MASwiftInitializingExpressionTest >> testPrintSwiftOn [
	| declaration |

	declaration := MASwiftInitializingExpression new
		type: #URL;
		arguments:
			{(MASwiftFunctionCallArgument new
				name: #string;
				yourself)};
		yourself.

	self assertDeclaration: declaration prints: 'URL(string: nil)'.

	declaration arguments first expression: 'http://example.com'.
	self assertDeclaration: declaration prints: 'URL(string: "http://example.com")'
]
