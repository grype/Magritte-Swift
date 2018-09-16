Class {
	#name : #MASwiftAbstractStructDeclaration,
	#superclass : #MASwiftAbstractDeclaration,
	#instVars : [
		'accessLevelModifiers',
		'name',
		'genericParameters',
		'inheritanceTypes',
		'whereRequirements',
		'expressions'
	],
	#category : #'Magritte-Swift-Source'
}

{ #category : #accessing }
MASwiftAbstractStructDeclaration >> accessLevelModifiers [
	^ accessLevelModifiers
]

{ #category : #accessing }
MASwiftAbstractStructDeclaration >> accessLevelModifiers: anObject [
	accessLevelModifiers := anObject
]

{ #category : #accessing }
MASwiftAbstractStructDeclaration >> expressions [
	^ expressions
]

{ #category : #accessing }
MASwiftAbstractStructDeclaration >> expressions: anObject [
	expressions := anObject
]

{ #category : #accessing }
MASwiftAbstractStructDeclaration >> genericParameters [
	^ genericParameters
]

{ #category : #accessing }
MASwiftAbstractStructDeclaration >> genericParameters: anObject [
	genericParameters := anObject
]

{ #category : #testing }
MASwiftAbstractStructDeclaration >> hasSubexpressions [
	^ expressions isEmptyOrNil not
]

{ #category : #accessing }
MASwiftAbstractStructDeclaration >> inheritanceTypes [
	^ inheritanceTypes
]

{ #category : #accessing }
MASwiftAbstractStructDeclaration >> inheritanceTypes: anObject [
	inheritanceTypes := anObject
]

{ #category : #initialization }
MASwiftAbstractStructDeclaration >> initialize [
	super initialize.
	attributes := OrderedCollection new.
	genericParameters := OrderedCollection new.
	inheritanceTypes := OrderedCollection new.
	whereRequirements := OrderedCollection new
]

{ #category : #accessing }
MASwiftAbstractStructDeclaration >> name [
	^ name
]

{ #category : #accessing }
MASwiftAbstractStructDeclaration >> name: anObject [
	name := anObject
]

{ #category : #printing }
MASwiftAbstractStructDeclaration >> printAccessLevelModifiersOn: aStream [
	accessLevelModifiers isEmptyOrNil
		ifTrue: [ ^ false ].
	accessLevelModifiers do: [ :each | each printSwiftOn: aStream ] separatedBy: [ aStream nextPut: Character space ].
	^ true
]

{ #category : #printing }
MASwiftAbstractStructDeclaration >> printAttributesOn: aStream [
	attributes isEmptyOrNil
		ifTrue: [ ^ false ].
	attributes do: [ :attr | attr printSwiftOn: aStream ] separatedBy: [ aStream nextPut: Character space ].
	^ true
]

{ #category : #printing }
MASwiftAbstractStructDeclaration >> printGenericParametersOn: aStream [
	genericParameters isEmptyOrNil
		ifTrue: [ ^ false ].
	aStream nextPut: $<.
	genericParameters do: [ :each | each printSwiftOn: aStream ] separatedBy: [ aStream nextPutAll: ', ' ].
	aStream nextPut: $>.
	^ true
]

{ #category : #printing }
MASwiftAbstractStructDeclaration >> printInheritanceTypesOn: aStream [
	inheritanceTypes isEmptyOrNil
		ifTrue: [ ^ false ].
	aStream nextPutAll: ': '.
	inheritanceTypes do: [ :each | each printSwiftOn: aStream ] separatedBy: [ aStream nextPutAll: ', ' ].
	^ true
]

{ #category : #printing }
MASwiftAbstractStructDeclaration >> printNameOn: aStream [
	aStream nextPutAll: name.
	^ true
]

{ #category : #printing }
MASwiftAbstractStructDeclaration >> printStructIdentifierOn: aStream [
	self subclassResponsibility
]

{ #category : #printing }
MASwiftAbstractStructDeclaration >> printSwiftOn: aStream [
	| last |

	last := false.
	{[ self printAttributesOn: aStream ].
	[ self printAccessLevelModifiersOn: aStream ].
	[ self printStructIdentifierOn: aStream ].
	[ self printNameOn: aStream ]}
		do: [ :each | last := each value ]
		separatedBy: [ last
				ifTrue: [ aStream nextPut: Character space ] ].
	inheritanceTypes isEmptyOrNil
		ifFalse: [ aStream nextPut: Character space.
			self printInheritanceTypesOn: aStream ].
	genericParameters isEmptyOrNil
		ifFalse: [ aStream nextPut: Character space.
			self printGenericParametersOn: aStream ].
	whereRequirements isEmptyOrNil
		ifTrue: [ ^ self ].
	aStream nextPut: Character space.
	self printWhereRequirementsOn: aStream
]

{ #category : #printing }
MASwiftAbstractStructDeclaration >> printWhereRequirementsOn: aStream [
	whereRequirements isEmptyOrNil
		ifTrue: [ ^ false ].
	aStream nextPutAll: 'where '.
	whereRequirements do: [ :each | each printSwiftOn: aStream ] separatedBy: [ aStream nextPutAll: ', ' ].
	^ true
]

{ #category : #accessing }
MASwiftAbstractStructDeclaration >> whereRequirements [
	^ whereRequirements
]

{ #category : #accessing }
MASwiftAbstractStructDeclaration >> whereRequirements: anObject [
	whereRequirements := anObject
]
