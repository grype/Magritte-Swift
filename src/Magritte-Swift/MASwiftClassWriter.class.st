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
	^ prefix, aString capitalized.
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
		type: (MASwiftType new name: aDescription class swiftType; yourself);
		yourself
]

{ #category : #utility }
MASwiftClassWriter >> functionSignatureFromDescriptions: aCollectionOfDescription [
	^ MASwiftFunctionSignature new
		parameters:
			(aCollectionOfDescription collect: [ :each | self functionParamaterFromDescription: each ]);
		yourself
]

{ #category : #utility }
MASwiftClassWriter >> requiredChildDescriptionsOf: aDescription [
	^ (aDescription children
		select: [ :each | each isSwiftSerialized and: [ each isRequired ] ])
		sort: [ :a :b | a priority < b priority ]
]

{ #category : #'visiting-description' }
MASwiftClassWriter >> visitBooleanDescription: aDescription [
	stream varNamed: aDescription swiftName ofType: 'Bool' isOptional: aDescription isRequired not
]

{ #category : #'visiting-description' }
MASwiftClassWriter >> visitColorDescription: aDescription [
	stream varNamed: aDescription swiftName ofType: 'UIColor' isOptional: aDescription isRequired not
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
	stream varNamed: aDescription swiftName ofType: 'Date' isOptional: aDescription isRequired not
]

{ #category : #'visiting-description' }
MASwiftClassWriter >> visitStringDescription: aDescription [
	stream varNamed: aDescription swiftName ofType: 'String' isOptional: aDescription isRequired not
]

{ #category : #'visiting-description' }
MASwiftClassWriter >> visitSwiftClassContainer: aDescription [
	| requiredDescriptions initContainer classDeclaration |

	classDeclaration := MASwiftClassDeclaration new
		name: aDescription swiftName;
		inheritanceTypes: (aDescription inheritsFrom ifNotNil: [ :val | val asOrderedCollection ]);
		yourself.
	stream
		declaration: classDeclaration
		with: [ (aDescription children sort: [ :a :b | a priority < b priority ])
				do: [ :each | 
					each isSwiftSerialized
						ifTrue: [ each writeSwiftDeclarationOf: self object on: stream ] ].

			stream cr.

			requiredDescriptions := self requiredChildDescriptionsOf: aDescription.
			initContainer := MASwiftClassInitContainer withAll: requiredDescriptions.
			self visit: initContainer ]
]

{ #category : #'visiting-description' }
MASwiftClassWriter >> visitSwiftClassInitContainer: aContainer [
	| children init |

	children := aContainer children.
	init := MASwiftInitDeclaration new
		signature: (self functionSignatureFromDescriptions: children);
		yourself.
	stream
		function: init
		with: [ children
				do: [ :each | 
					stream
						assignmentExpression:
							(MASwiftAssignmentExpression new
								receiver: each swiftName;
								expression: (self canonicalArgumentNameFrom: each swiftName)) ] ]
]

{ #category : #'visiting-description' }
MASwiftClassWriter >> visitSwiftEnumContainer: aDescription [
	stream
		enum: aDescription swiftName
		inherits: aDescription inheritsFrom
		with: [ aDescription
				do: [ :each | 
					each isSwiftCodable
						ifTrue: [ each writeSwiftDeclarationOf: self object on: stream ] ] ]
]

{ #category : #'visiting-description' }
MASwiftClassWriter >> visitSwiftStructContainer: aDescription [
	stream
		struct: aDescription swiftName
		inherits: aDescription inheritsFrom
		with: [ aDescription
				do: [ :each | 
					each isSwiftSerialized
						ifTrue: [ each writeSwiftDeclarationOf: self object on: stream ] ] ]
]

{ #category : #'visiting-description' }
MASwiftClassWriter >> visitTimeDescription: aDescription [ 
	stream varNamed: aDescription swiftName ofType: 'Date' isOptional: aDescription isRequired not
]

{ #category : #'visiting-description' }
MASwiftClassWriter >> visitTimeStampDescription: aDescription [
	stream varNamed: aDescription swiftName ofType: 'Date' isOptional: aDescription isRequired not
]

{ #category : #'visiting-description' }
MASwiftClassWriter >> visitToManyRelationDescription: aDescription [
	| classes |

	classes := aDescription classes.
	classes size > 1
		ifTrue: [ stream
				varNamed: aDescription swiftName
				ofType:
					('[{1}:{2}]'
						format:
							{classes first swiftClassDescription swiftName.
							classes second swiftClassDescription swiftName})
				isOptional: aDescription isRequired not ]
		ifFalse: [ stream
				varNamed: aDescription swiftName
				ofType: ('[{1}]' format: {classes first swiftClassDescription swiftName})
				isOptional: aDescription isRequired not ]
]

{ #category : #'visiting-description' }
MASwiftClassWriter >> visitToOneRelationDescription: aDescription [
	stream
		varNamed: aDescription swiftName
		ofType: aDescription classes first swiftClassDescription swiftName
		isOptional: aDescription isRequired not
]

{ #category : #'visiting-description' }
MASwiftClassWriter >> visitUrlDescription: aMAUrlDescription [ 
	stream varNamed: aMAUrlDescription swiftName ofType: 'URL' isOptional: aMAUrlDescription isRequired not
]
