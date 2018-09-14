Class {
	#name : #MASwiftAbstractFunctionDeclaration,
	#superclass : #MASwiftAbstractDeclaration,
	#instVars : [
		'declarationModifiers',
		'genericParameters',
		'signature',
		'body'
	],
	#category : #'Magritte-Swift-Source'
}

{ #category : #accessing }
MASwiftAbstractFunctionDeclaration >> body [
	^ body
]

{ #category : #accessing }
MASwiftAbstractFunctionDeclaration >> body: anObject [
	body := anObject
]

{ #category : #accessing }
MASwiftAbstractFunctionDeclaration >> declarationModifiers [
	^ declarationModifiers
]

{ #category : #accessing }
MASwiftAbstractFunctionDeclaration >> declarationModifiers: anObject [
	declarationModifiers := anObject
]

{ #category : #accessing }
MASwiftAbstractFunctionDeclaration >> genericParameters [
	^ genericParameters
]

{ #category : #accessing }
MASwiftAbstractFunctionDeclaration >> genericParameters: anObject [
	genericParameters := anObject
]

{ #category : #printing }
MASwiftAbstractFunctionDeclaration >> printDeclarationModifiersOn: aStream [
	declarationModifiers isEmptyOrNil
		ifTrue: [ ^ false ].

	declarationModifiers do: [ :aString | aStream nextPutAll: aString ] separatedBy: [ aStream nextPut: Character space ].
	^ true
]

{ #category : #printing }
MASwiftAbstractFunctionDeclaration >> printFunctionIdentifier: aStream [
	self subclassResponsibility 
]

{ #category : #printing }
MASwiftAbstractFunctionDeclaration >> printGenericParametersOn: aStream [
	genericParameters isEmptyOrNil
		ifTrue: [ ^ false ].

	aStream nextPut: $<.
	genericParameters do: [ :each | each printSwiftOn: aStream ] separatedBy: [ aStream nextPutAll: ', ' ].
	aStream nextPut: $>.
	^ true
]

{ #category : #printing }
MASwiftAbstractFunctionDeclaration >> printSignatureOn: aStream [
	signature ifNil: [ aStream nextPutAll: '()' ] ifNotNil: [ :sig | sig printSwiftOn: aStream ].
	^ true
]

{ #category : #printing }
MASwiftAbstractFunctionDeclaration >> printSwiftOn: aStream [
	| last |

	last := false.
	{[ self printAttributesOn: aStream ].
	[ self printDeclarationModifiersOn: aStream ].
	[ self printFunctionIdentifier: aStream ]}
		do: [ :each | last := each value ]
		separatedBy: [ last
				ifTrue: [ aStream nextPut: Character space ] ].

	self printGenericParametersOn: aStream.
	self printSignatureOn: aStream
]

{ #category : #accessing }
MASwiftAbstractFunctionDeclaration >> signature [
	^ signature
]

{ #category : #accessing }
MASwiftAbstractFunctionDeclaration >> signature: anObject [
	signature := anObject
]
