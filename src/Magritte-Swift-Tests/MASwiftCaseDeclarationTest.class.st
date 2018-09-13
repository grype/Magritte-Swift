Class {
	#name : #MASwiftCaseDeclarationTest,
	#superclass : #MASwiftSourceTestCase,
	#category : #'Magritte-Swift-Tests'
}

{ #category : #tests }
MASwiftCaseDeclarationTest >> testPrintSwiftOn [
	| declaration |

	declaration := MASwiftCaseDeclaration new
		name: #foo;
		yourself.
	self assertDeclaration: declaration prints: 'case foo'.

	declaration isIndirect: true.
	self assertDeclaration: declaration prints: 'indirect case foo'.

	declaration assignedValue: 'I am a string'.
	self assertDeclaration: declaration prints: 'indirect case foo = "I am a string"'
]
