Class {
	#name : #MASwiftDocumentTest,
	#superclass : #TestCase,
	#instVars : [
		'document'
	],
	#category : #'Magritte-Swift-Tests'
}

{ #category : #'tests-creation' }
MASwiftDocumentTest >> createBasicFunctionDeclaration [
	^ MASwiftFunctionDeclaration new
		name: 'foo';
		yourself
]

{ #category : #'tests-creation' }
MASwiftDocumentTest >> createBasicInitDeclaration [
	^ MASwiftInitDeclaration new
		yourself
]

{ #category : #'tests-creation' }
MASwiftDocumentTest >> createFunctionDeclarationAttributes [
	^ OrderedCollection
		with:
			(MASwiftAttribute new
				name: 'objc';
				yourself)
		with:
			(MASwiftAttribute new
				name: 'available';
				argumentClause: '(iOS 10.0, macOS 10.12, *)';
				yourself)
]

{ #category : #'tests-creation' }
MASwiftDocumentTest >> createFunctionDeclarationSignature [
	"(_: Foo, bar: Bar!, baz aBaz: Baz? = nil)"

	| foo bar baz |

	foo := MASwiftFunctionParameter new
		name: '_';
		type:
			(MASwiftType new
				name: 'Foo';
				yourself);
		yourself.

	bar := MASwiftFunctionParameter new
		name: 'bar';
		type:
			(MASwiftType new
				name: 'Bar';
				isImplicitlyUnwrappedOptional: true;
				yourself);
		yourself.

	baz := MASwiftFunctionParameter new
		name: 'baz';
		localName: 'aBaz';
		type:
			(MASwiftType new
				name: 'Baz';
				isOptional: true;
				yourself);
		defaultValue: 'nil';
		yourself.

	^ MASwiftFunctionSignature new
		parameters:
			{foo.
			bar.
			baz}
]

{ #category : #running }
MASwiftDocumentTest >> resetDocument [
	document := MASwiftDocument on: '' writeStream.
]

{ #category : #running }
MASwiftDocumentTest >> setUp [
	self resetDocument
]

{ #category : #tests }
MASwiftDocumentTest >> testAssignmentExpression [
	document
		assignmentExpression:
			(MASwiftAssignmentExpression new
				receiver: 'foo';
				expression: 'bar';
				yourself).
	self assert: document stream contents equals: 'foo = bar'
]

{ #category : #tests }
MASwiftDocumentTest >> testCloseClass [
	document closeClass.
	self assert: document stream contents equals: '}'
]

{ #category : #tests }
MASwiftDocumentTest >> testComment [
	document comment: 'I am a multi-line comment'.
	self assert: document stream contents equals: '// I am a multi-line comment'.

	self resetDocument.
	
	document comment: (#('One' 'Two' 'Three') joinUsing: Character cr greaseString).
	self assert: document stream contents equals: '/**
 * One
 * Two
 * Three
 */'
]

{ #category : #tests }
MASwiftDocumentTest >> testCr [
	document cr.
	self assert: document stream contents equals: Character cr greaseString
]

{ #category : #tests }
MASwiftDocumentTest >> testImport [
	document import: 'Foundation'.
	self assert: document stream contents equals: 'import Foundation'
]

{ #category : #tests }
MASwiftDocumentTest >> testLiteral [
	document literal: 'Literal'.
	self assert: document stream contents equals: 'Literal'
]

{ #category : #tests }
MASwiftDocumentTest >> testMultilineComment [
	document multilineComment: 'I am a multi-line comment'.
	self assert: document stream contents equals: '/**
 * I am a multi-line comment
 */'.

	self resetDocument.
	
	document multilineComment: (#('One' 'Two' 'Three') joinUsing: Character cr greaseString).
	self assert: document stream contents equals: '/**
 * One
 * Two
 * Three
 */'
]

{ #category : #tests }
MASwiftDocumentTest >> testOpenBasicFunctionDeclaration [
	| func |

	func := self createBasicFunctionDeclaration.
	document openFunctionDeclaration: func.
	self assert: document stream contents equals: 'func foo() {'
]

{ #category : #tests }
MASwiftDocumentTest >> testOpenBasicInitDeclaration [
	| func |

	func := self createBasicInitDeclaration.
	document openFunctionDeclaration: func.
	self assert: document stream contents equals: 'init() {'
]

{ #category : #tests }
MASwiftDocumentTest >> testOpenClassInherits [
	document openClass: 'Foo' inherits: #(#Bar #Baz).
	self assert: document stream contents equals: 'class Foo: Bar, Baz {'
]

{ #category : #tests }
MASwiftDocumentTest >> testOpenFunctionDeclaration [
	self testOpenBasicFunctionDeclaration.
	self resetDocument.
	self testOpenFunctionDeclarationWithAttributes.
	self resetDocument.
	self testOpenFunctionDeclarationWithGenericParameters.
	self resetDocument.
	self testOpenFunctionDeclarationWithParameters
]

{ #category : #tests }
MASwiftDocumentTest >> testOpenFunctionDeclarationWithAttributes [
	| func |

	func := self createBasicFunctionDeclaration.
	func attributes: self createFunctionDeclarationAttributes.
	document openFunctionDeclaration: func.
	self
		assert: document stream contents
		equals: '@objc @available(iOS 10.0, macOS 10.12, *) func foo() {'.
]

{ #category : #tests }
MASwiftDocumentTest >> testOpenFunctionDeclarationWithGenericParameters [
	| func |

	func := self createBasicFunctionDeclaration.
	func genericParameters: #(#One #Two).
	document openFunctionDeclaration: func.
	self
		assert: document stream contents
		equals: 'func foo<One, Two>() {'.
]

{ #category : #tests }
MASwiftDocumentTest >> testOpenFunctionDeclarationWithParameters [
	| func |

	func := self createBasicFunctionDeclaration.
	func signature: self createFunctionDeclarationSignature.
	document openFunctionDeclaration: func.
	self assert: document stream contents equals: 'func foo(_: Foo, bar: Bar!, baz aBaz: Baz? = nil) {'
]

{ #category : #tests }
MASwiftDocumentTest >> testOpenInitDeclaration [
	self testOpenBasicInitDeclaration
]

{ #category : #tests }
MASwiftDocumentTest >> testSinglelineComment [
	document singlelineComment: 'I am a single line comment'.
	self assert: document stream contents equals: '// I am a single line comment'.

	self resetDocument.

	document
		singlelineComment: 'I am a multi-line comment' , Character cr greaseString , 'formatted as a single-line comment'.
	self
		assert: document stream contents
		equals:
			'// I am a multi-line comment' , Character cr greaseString
				, '// formatted as a single-line comment'
]

{ #category : #tests }
MASwiftDocumentTest >> testString [
	document string: 'I am a "string".'.
	self assert: document stream contents equals: '"I am a \"string\"."'
]

{ #category : #tests }
MASwiftDocumentTest >> testVarNamedOfTypeIsOptional [
	document varNamed: 'foo' ofType: 'String' isOptional: true.
	self assert: document stream contents equals: 'var foo: String?'
]
