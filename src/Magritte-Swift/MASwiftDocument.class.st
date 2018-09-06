Class {
	#name : #MASwiftDocument,
	#superclass : #WADocument,
	#instVars : [
		'indentation'
	],
	#category : #'Magritte-Swift-Core'
}

{ #category : #writing }
MASwiftDocument >> assignmentExpression: anAssignmentExpresion [
	anAssignmentExpresion writeOn: stream 
]

{ #category : #writing }
MASwiftDocument >> closeClass [
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
	indentation := indentation + 1
]

{ #category : #initialization }
MASwiftDocument >> initialize [
	super initialize.
	indentation := 0
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
MASwiftDocument >> openFunctionDeclaration: aFunctionDeclaration [
	aFunctionDeclaration writeOn: stream. stream nextPutAll: ' {'
]

{ #category : #formatting }
MASwiftDocument >> outdent [
	indentation := (indentation - 1) max: 0
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
	indentation > 0 ifFalse: [ ^ self ].
	1 to: indentation do: [ :i | stream nextPut: Character tab ]
]
