Class {
	#name : #MASwiftImportDeclaration,
	#superclass : #MASwiftAbstractDeclaration,
	#instVars : [
		'moduleName',
		'name',
		'kind'
	],
	#category : #'Magritte-Swift-Source'
}

{ #category : #'instance-creation' }
MASwiftImportDeclaration class >> named: aString [
	^ self new
		name: aString;
		yourself
]

{ #category : #accessing }
MASwiftImportDeclaration >> kind [
	^ kind
]

{ #category : #accessing }
MASwiftImportDeclaration >> kind: anObject [
	kind := anObject
]

{ #category : #accessing }
MASwiftImportDeclaration >> moduleName [
	^ moduleName
]

{ #category : #accessing }
MASwiftImportDeclaration >> moduleName: anObject [
	moduleName := anObject
]

{ #category : #accessing }
MASwiftImportDeclaration >> name [
	^ name
]

{ #category : #accessing }
MASwiftImportDeclaration >> name: anObject [
	name := anObject
]

{ #category : #printing }
MASwiftImportDeclaration >> printSwiftOn: aStream [
	(self printAttributesOn: aStream)
		ifTrue: [ aStream nextPut: Character space ].

	aStream nextPutAll: 'import '.

	kind
		ifNotNil: [ kind printSwiftOn: aStream.
			aStream nextPut: Character space ].

	moduleName
		ifNotNil: [ :val | 
			aStream
				nextPutAll: moduleName;
				nextPut: $. ].
	aStream nextPutAll: name
]
