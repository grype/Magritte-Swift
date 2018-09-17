Class {
	#name : #MASwiftReturnExpressionTest,
	#superclass : #MASwiftSourceTestCase,
	#category : #'Magritte-Swift-Tests'
}

{ #category : #tests }
MASwiftReturnExpressionTest >> testPrintSwiftOn [
	| declaration |

	declaration := MASwiftReturnExpression new.
	self assertDeclaration: declaration prints: 'return nil'.

	declaration expression: 'a return string'.
	self assertDeclaration: declaration prints: 'return "a return string"'.

	declaration expression: #String.
	self assertDeclaration: declaration prints: 'return String'.

	declaration
		expression:
			(MASwiftType new
				name: #String;
				isOptional: true;
				yourself).
	self assertDeclaration: declaration prints: 'return String?'.
	
	declaration expression: (MASwiftCastingExpression new expression: #foo; type: #String; yourself ).
	self assertDeclaration: declaration prints: 'return foo as String'.
]
