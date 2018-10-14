Class {
	#name : #MASwiftClassWriter,
	#superclass : #MAStringWriter,
	#category : #'Magritte-Swift-Core'
}

{ #category : #utility }
MASwiftClassWriter >> canonicalArgumentNameFrom: aString [
	| prefix |

	prefix := aString first isVowel
		ifTrue: [ 'an' ]
		ifFalse: [ 'a' ].
	^ (prefix , aString capitalized) asSymbol
]

{ #category : #private }
MASwiftClassWriter >> defaultWriteStream [
	^ MASwiftCanvas builder
]

{ #category : #utility }
MASwiftClassWriter >> functionParamaterFromDescription: aDescription [
	^ MASwiftFunctionParameter new
		name: aDescription swiftName;
		localName: (self canonicalArgumentNameFrom: aDescription swiftName);
		type: (MASwiftType new name: aDescription swiftType; yourself);
		yourself
]

{ #category : #utility }
MASwiftClassWriter >> functionSignatureFromDescriptions: aCollectionOfDescription [
	^ MASwiftFunctionSignature new
		parameters:
			(aCollectionOfDescription collect: [ :each | self functionParamaterFromDescription: each ]);
		yourself
]

{ #category : #'visiting-description' }
MASwiftClassWriter >> visitBooleanDescription: aDescription [
	aDescription asSwiftVariableDeclaration
		ifNotNil: [ :aDeclaration | stream declaration: aDeclaration ]
]

{ #category : #'visiting-description' }
MASwiftClassWriter >> visitColorDescription: aDescription [
	aDescription asSwiftVariableDeclaration
		ifNotNil: [ :aDeclaration | stream declaration: aDeclaration ]
]

{ #category : #'visiting-description' }
MASwiftClassWriter >> visitContainer: aDescription [
	aDescription
		do: [ :each | 
			each isSwiftSerialized
				ifTrue: [ each writeSwiftDeclarationOf: self object on: stream] ]
]

{ #category : #'visiting-description' }
MASwiftClassWriter >> visitDateAndTimeDescription: aDescription [
	aDescription asSwiftVariableDeclaration
		ifNotNil: [ :aDeclaration | stream declaration: aDeclaration ]
]

{ #category : #'visiting-description' }
MASwiftClassWriter >> visitMagnitudeDescription: aDescription [
	aDescription asSwiftVariableDeclaration
		ifNotNil: [ :aDeclaration | stream declaration: aDeclaration ]
]

{ #category : #'visiting-description' }
MASwiftClassWriter >> visitStringDescription: aDescription [
	aDescription asSwiftVariableDeclaration
		ifNotNil: [ :aDeclaration | stream declaration: aDeclaration ]
]

{ #category : #'visiting-description' }
MASwiftClassWriter >> visitSwiftClassContainer: aDescription [
	| classDeclaration |

	classDeclaration := MASwiftClassDeclaration new
		name: aDescription swiftName;
		inheritanceTypes: (aDescription inheritsFrom ifNotNil: [ :val | val asOrderedCollection ]);
		yourself.

	aDescription hasCodableChildren
		ifTrue: [ classDeclaration inheritanceTypes add: #Decodable ].

	aDescription hasStringConvertibleChildren
		ifTrue: [ classDeclaration inheritanceTypes add: #CustomStringConvertible ].

	stream
		declaration: classDeclaration
		with: [ (aDescription swiftSerializableChildren sort: [ :a :b | a priority < b priority ])
				do: [ :each | each writeSwiftDeclarationOf: self object on: stream ]
				separatedBy: [ stream cr ].

			aDescription swiftSerializableChildren
				ifNotEmpty: [ stream
						cr;
						cr ].

			aDescription childContainers
				do: [ :aChildContainer | self visit: aChildContainer ]
				separatedBy: [ stream
						cr;
						cr ] ]
]

{ #category : #'visiting-description' }
MASwiftClassWriter >> visitSwiftClassInitContainer: aContainer [
	| children init |

	children := aContainer children.
	init := MASwiftInitDeclaration new
		signature: (self functionSignatureFromDescriptions: children);
		yourself.
	stream
		declaration: init
		with: [ children
				do: [ :each | 
					stream
						expression:
							(MASwiftAssignmentExpression new
								receiver: each swiftName;
								expression: (self canonicalArgumentNameFrom: each swiftName)) ]
				separatedBy: [ stream cr ] ]
]

{ #category : #'visiting-description' }
MASwiftClassWriter >> visitSwiftDeclarationContainer: aDescription [
	aDescription childDeclarations isEmptyOrNil
		ifTrue: [ stream declaration: aDescription declaration ]
		ifFalse: [ stream
				declaration: aDescription declaration
				with: [ aDescription childDeclarations
						do: [ :aChildDeclaration | stream declaration: aChildDeclaration ]
						separatedBy: [ stream cr ] ] ]
]

{ #category : #'visiting-description' }
MASwiftClassWriter >> visitSwiftEnumContainer: aDescription [
	| enum |

	enum := MASwiftEnumDeclaration new
		name: aDescription swiftName;
		inheritanceTypes: aDescription inheritsFrom;
		yourself.
	stream
		declaration: enum
		with: [ aDescription swiftCodableChildren
				do: [ :each | stream declaration: (MASwiftCaseDeclaration named: each swiftName) ]
				separatedBy: [ stream cr ] ]
]

{ #category : #'visiting-description' }
MASwiftClassWriter >> visitSwiftStructContainer: aDescription [
	| enum |

	enum := MASwiftStructDeclaration new
		name: aDescription swiftName;
		inheritsFrom: aDescription inheritsFrom;
		yourself.
	stream
		declaration: enum
		with: [ aDescription
				do: [ :each | 
					each isSwiftSerialized
						ifTrue: [ each writeSwiftDeclarationOf: self object on: stream ] ] ]
]

{ #category : #'visiting-description' }
MASwiftClassWriter >> visitTimeDescription: aDescription [ 
	aDescription asSwiftVariableDeclaration
		ifNotNil: [ :aDeclaration | stream declaration: aDeclaration ]
]

{ #category : #'visiting-description' }
MASwiftClassWriter >> visitTimeStampDescription: aDescription [
	aDescription asSwiftVariableDeclaration
		ifNotNil: [ :aDeclaration | stream declaration: aDeclaration ]
]

{ #category : #'visiting-description' }
MASwiftClassWriter >> visitToManyRelationDescription: aDescription [
	aDescription asSwiftVariableDeclaration
		ifNotNil: [ :aDeclaration | stream declaration: aDeclaration ]
]

{ #category : #'visiting-description' }
MASwiftClassWriter >> visitToOneRelationDescription: aDescription [
	aDescription asSwiftVariableDeclaration
		ifNotNil: [ :aDeclaration | stream declaration: aDeclaration ]
]

{ #category : #'visiting-description' }
MASwiftClassWriter >> visitUrlDescription: aDescription [
	aDescription asSwiftVariableDeclaration
		ifNotNil: [ :aDeclaration | stream declaration: aDeclaration ]
]
