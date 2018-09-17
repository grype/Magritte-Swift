Class {
	#name : #MASwiftWrappingExpressionTest,
	#superclass : #MASwiftSourceTestCase,
	#category : #'Magritte-Swift-Tests'
}

{ #category : #tests }
MASwiftWrappingExpressionTest >> testPrintSwiftOn [
	| declaration |

	declaration := MASwiftWrappingExpression new.
	self assertDeclaration: declaration prints: '( nil )'.
	
	declaration expression: 'I am a string'.
	self assertDeclaration: declaration prints: '( "I am a string" )'.
	
	declaration expression: (OrderedCollection with: 'Foo') .
	self assertDeclaration: declaration prints: '( ["Foo"] )'.
	
	declaration expression: (MASwiftCastingExpression new type: #String; isOptional: true; expression: #foo ).
	self assertDeclaration: declaration prints: '( foo as? String )'.
]
