Class {
	#name : #MASwiftVariableDeclarationTest,
	#superclass : #MASwiftSourceTestCase,
	#category : #'Magritte-Swift-Tests'
}

{ #category : #tests }
MASwiftVariableDeclarationTest >> testPrintSwiftOn [
	| declaration |
	declaration := MASwiftVariableDeclaration new name: #foo; type: #String; yourself.
	self assertDeclaration: declaration prints: 'var foo: String'.
	
	declaration type: (MASwiftType new name: #String; isOptional: true; yourself).
	self assertDeclaration: declaration prints: 'var foo: String?'.
	
	declaration initializingExpression: 'URL(string: "")'.
	self assertDeclaration: declaration prints: 'var foo: String? = URL(string: "")'.
]
