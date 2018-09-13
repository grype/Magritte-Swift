Class {
	#name : #MASwiftDocument,
	#superclass : #WADocument,
	#instVars : [
		'indentationLevel'
	],
	#category : #'Magritte-Swift-Core'
}

{ #category : #writing }
MASwiftDocument >> assignmentExpression: anAssignmentExpresion [
	anAssignmentExpresion printSwiftOn: stream 
]

{ #category : #writing }
MASwiftDocument >> closeClass [
	stream nextPut: $}
]

{ #category : #writing }
MASwiftDocument >> closeDeclaration [
	stream nextPut: $}
]

{ #category : #writing }
MASwiftDocument >> closeFunctionDeclaration [
	stream nextPut: $}
]

{ #category : #writing }
MASwiftDocument >> comment: aString [
	aString lineCount > 1
		ifTrue: [ self multilineComment: aString ]
		ifFalse: [ self singlelineComment: aString ]
]

{ #category : #writing }
MASwiftDocument >> cr [
	stream nextPut: Character cr
]

{ #category : #writing }
MASwiftDocument >> import: aString [
	stream
		nextPutAll: 'import ';
		nextPutAll: aString
]

{ #category : #formatting }
MASwiftDocument >> indent [
	indentationLevel := indentationLevel + 1
]

{ #category : #initialization }
MASwiftDocument >> initialize [
	super initialize.
	indentationLevel := 0
]

{ #category : #writing }
MASwiftDocument >> literal: aString [
	stream nextPutAll: aString
]

{ #category : #writing }
MASwiftDocument >> multilineComment: aString [
	| pfx |

	pfx := ' * '.
	stream
		nextPutAll: '/**';
		nextPut: Character cr;
		nextPutAll: pfx;
		nextPutAll:
			((aString copyReplaceAll: Character cr greaseString with: Character cr greaseString , pfx)
				copyReplaceAll: Character lf greaseString
				with: Character cr greaseString , pfx);
		nextPut: Character cr;
		nextPutAll: ' */'
]

{ #category : #writing }
MASwiftDocument >> openClass: aClassName inherits: aCollectionOfStrings [
	stream
		nextPutAll: 'class ';
		nextPutAll: aClassName.
	aCollectionOfStrings
		ifNotNil: [ :val | 
			stream
				nextPutAll: ': ';
				nextPutAll: (val joinUsing: ', ') ].
	stream nextPutAll: ' {'
]

{ #category : #writing }
MASwiftDocument >> openDeclaration: aClassDeclaration [
	aClassDeclaration printSwiftOn: stream.
	stream nextPutAll: ' {'
]

{ #category : #writing }
MASwiftDocument >> openEnum: aClassName inherits: aCollectionOfStrings [
	stream
		nextPutAll: 'enum ';
		nextPutAll: aClassName.
	aCollectionOfStrings
		ifNotNil: [ :val | 
			stream
				nextPutAll: ': ';
				nextPutAll: (val joinUsing: ', ') ].
	stream nextPutAll: ' {'
]

{ #category : #writing }
MASwiftDocument >> openFunctionDeclaration: aFunctionDeclaration [
	aFunctionDeclaration printSwiftOn: stream. stream nextPutAll: ' {'
]

{ #category : #formatting }
MASwiftDocument >> outdent [
	indentationLevel := (indentationLevel - 1) max: 0
]

{ #category : #writing }
MASwiftDocument >> singlelineComment: aString [
	| sep |

	sep := '// '.
	stream
		nextPutAll: sep;
		nextPutAll:
			((aString copyReplaceAll: Character cr greaseString with: Character cr greaseString, sep)
				copyReplaceAll: Character lf greaseString
				with: Character cr greaseString , sep)
]

{ #category : #writing }
MASwiftDocument >> string: aString [
	stream nextPut: $"; nextPutAll: (aString copyReplaceAll: '"' with: '\"'); nextPut: $"
]

{ #category : #writing }
MASwiftDocument >> varNamed: aVarNameString ofType: aTypeString isOptional: isOptional [
	stream
		nextPutAll: 'var ';
		nextPutAll: aVarNameString;
		nextPutAll: ': ';
		nextPutAll: aTypeString.
	isOptional
		ifTrue: [ stream nextPut: $? ]
]

{ #category : #writing }
MASwiftDocument >> writeIndent [
	indentationLevel > 0 ifFalse: [ ^ self ].
	1 to: indentationLevel do: [ :i | stream nextPut: Character tab ]
]
