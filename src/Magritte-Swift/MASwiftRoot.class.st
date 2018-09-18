Class {
	#name : #MASwiftRoot,
	#superclass : #WARoot,
	#instVars : [
		'imports',
		'preambleComment'
	],
	#category : #'Magritte-Swift-Core'
}

{ #category : #writing }
MASwiftRoot >> closeOn: aDocument [
	"Close aDocument and optionally write its footer."
]

{ #category : #accessing }
MASwiftRoot >> imports [
	^ imports
]

{ #category : #initialization }
MASwiftRoot >> initialize [
	super initialize.
	imports := OrderedCollection with: (MASwiftImportDeclaration named: #Foundation).
	preambleComment := 'This file was generated with Magritte-Swift'
]

{ #category : #writing }
MASwiftRoot >> openOn: aDocument [
	self writePreambleOn: aDocument 
]

{ #category : #accessing }
MASwiftRoot >> preambleComment [
	^ preambleComment
]

{ #category : #accessing }
MASwiftRoot >> preambleComment: anObject [
	preambleComment := anObject
]

{ #category : #writing }
MASwiftRoot >> writeImportsOn: aDocument [
	imports do: [ :anImport | aDocument declaration: anImport ]
]

{ #category : #writing }
MASwiftRoot >> writePreambleOn: aDocument [
	preambleComment ifNotNil: [ :aComment | aDocument comment: aComment ].
	aDocument
		cr;
		cr.
	imports
		ifNotEmpty: [ self writeImportsOn: aDocument.
			aDocument
				cr;
				cr ]
]
