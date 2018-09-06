Class {
	#name : #MASwiftAbstractFunctionDeclaration,
	#superclass : #MASwiftSourceObject,
	#instVars : [
		'attributes',
		'declarationModifiers',
		'genericParameters',
		'signature'
	],
	#category : #'Magritte-Swift-Source'
}

{ #category : #accessing }
MASwiftAbstractFunctionDeclaration >> attributes [
	^ attributes
]

{ #category : #accessing }
MASwiftAbstractFunctionDeclaration >> attributes: anObject [
	attributes := anObject
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

{ #category : #accessing }
MASwiftAbstractFunctionDeclaration >> signature [
	^ signature
]

{ #category : #accessing }
MASwiftAbstractFunctionDeclaration >> signature: anObject [
	signature := anObject
]

{ #category : #writing }
MASwiftAbstractFunctionDeclaration >> writeAttributesOn: aStream [
	attributes ifNil: [ ^ self ].
	attributes
		do: [ :each | 
			each writeOn: aStream.
			aStream nextPut: Character space ]
]

{ #category : #writing }
MASwiftAbstractFunctionDeclaration >> writeDeclarationModifiersOn: aStream [
	declarationModifiers
		ifNotNil: [ :modifiers | 
			modifiers
				do: [ :aString | 
					aStream
						nextPutAll: aString;
						nextPut: Character space ] ]
]

{ #category : #writing }
MASwiftAbstractFunctionDeclaration >> writeFunctionIdentifier: aStream [
	self subclassResponsibility 
]

{ #category : #writing }
MASwiftAbstractFunctionDeclaration >> writeGenericParametersOn: aStream [
	genericParameters
		ifNotNil: [ :params | 
			aStream
				nextPut: $<;
				nextPutAll: (params joinUsing: ', ');
				nextPut: $> ]
]

{ #category : #writing }
MASwiftAbstractFunctionDeclaration >> writeOn: aStream [
	self writeAttributesOn: aStream.
	self writeDeclarationModifiersOn: aStream.
	self writeFunctionIdentifier: aStream.
	self writeGenericParametersOn: aStream.
	self writeSignatureOn: aStream
]

{ #category : #writing }
MASwiftAbstractFunctionDeclaration >> writeSignatureOn: aStream [
	signature ifNil: [ aStream nextPutAll: '()' ] ifNotNil: [ :sig | sig writeOn: aStream ]
]
