Class {
	#name : #MASwiftTupleTypeTest,
	#superclass : #MASwiftSourceTestCase,
	#category : #'Magritte-Swift-Tests'
}

{ #category : #tests }
MASwiftTupleTypeTest >> testPrintSwiftOn [
	| declaration |

	declaration := MASwiftTupleType new
		types:
			{#Foo.
			#Bar.
			(MASwiftType new
				name: #Array;
				genericParameters: #(#String);
				yourself)};
		yourself.
		
	self assertDeclaration: declaration prints: '(Foo, Bar, Array<String>)'
]
