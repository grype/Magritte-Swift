Class {
	#name : #MASwiftDocument,
	#superclass : #WADocument,
	#instVars : [
		'indentationLevel'
	],
	#category : #'Magritte-Swift-Core'
}

{ #category : #writing }
MASwiftDocument >> array: anArray [
	stream nextPut: $[.
	anArray
		do: [ :each | each key printSwiftOn: stream ]
		separatedBy: [ stream nextPutAll: ', ' ].
	stream nextPut: $]
]

{ #category : #writing }
MASwiftDocument >> closeDeclaration [
	stream nextPut: $}
]

{ #category : #writing }
MASwiftDocument >> comment: aString [
	aString lineCount > 1
		ifTrue: [ self multilineComment: aString ]
		ifFalse: [ self singlelineComment: aString ]
]

{ #category : #writing }
MASwiftDocument >> dateAndTime: aDateAndTime [
	aDateAndTime printSwiftOn: stream
]

{ #category : #writing }
MASwiftDocument >> declaration: aDeclaration [
	aDeclaration printSwiftOn: stream
]

{ #category : #writing }
MASwiftDocument >> dictionary: aDictionary [
	aDictionary printSwiftOn: stream
]

{ #category : #writing }
MASwiftDocument >> expression: anAssignmentExpresion [
	anAssignmentExpresion printSwiftOn: stream 
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

{ #category : #'writing-formatting' }
MASwiftDocument >> lf [
	stream nextPut: Character lf
]

{ #category : #writing }
MASwiftDocument >> literal: anObject [
	stream nextPutAll: anObject greaseString
]

{ #category : #writing }
MASwiftDocument >> multilineComment: aString [
	| pfx |

	pfx := ' * '.
	stream
		nextPutAll: '/**';
		nextPut: Character lf;
		nextPutAll: pfx;
		nextPutAll:
			((aString copyReplaceAll: Character lf greaseString with: Character lf greaseString , pfx)
				copyReplaceAll: Character lf greaseString
				with: Character lf greaseString , pfx);
		nextPut: Character lf;
		nextPutAll: ' */'
]

{ #category : #writing }
MASwiftDocument >> number: aNumber [
	aNumber printSwiftOn: stream
]

{ #category : #writing }
MASwiftDocument >> openDeclaration: aClassDeclaration [
	aClassDeclaration printSwiftOn: stream.
	stream nextPutAll: ' {'
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
			((aString copyReplaceAll: Character lf greaseString with: Character lf greaseString, sep)
				copyReplaceAll: Character lf greaseString
				with: Character lf greaseString , sep)
]

{ #category : #writing }
MASwiftDocument >> string: aString [
	aString printSwiftOn: stream
]

{ #category : #writing }
MASwiftDocument >> url: anUrl [
	anUrl printSwiftOn: stream
]

{ #category : #'writing-formatting' }
MASwiftDocument >> writeIndent [
	indentationLevel > 0 ifFalse: [ ^ self ].
	1 to: indentationLevel do: [ :i | stream nextPut: Character tab ]
]
