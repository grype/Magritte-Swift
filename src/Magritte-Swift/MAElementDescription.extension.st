Extension { #name : #MAElementDescription }

{ #category : #'*Magritte-Swift' }
MAElementDescription >> asSwiftVariableDeclaration [
	| swiftType typeDeclaration |

	swiftType := self swiftType
		ifNil: [ self swiftDefaultValue
				ifNotNil: [ :val | 
					(val isKindOf: MASwiftInitializingExpression)
						ifTrue: [ val type ]
						ifFalse: [ nil ] ] ].

	swiftType ifNil: [ ^ self ].

	typeDeclaration := self swiftType
		ifNotNil: [ :aType | 
			(aType isKindOf: MASwiftType)
				ifTrue: [ aType ]
				ifFalse: [ MASwiftType new
						name: aType asSymbol;
						isOptional: self isRequired not;
						yourself ] ].

	^ self swiftVariableDeclarationClass new
		name: self swiftName asSymbol;
		declarationModifiers: self swiftDeclarationModifiers;
		initializingExpression: self swiftDefaultValue;
		type: typeDeclaration;
		yourself
]

{ #category : #'*Magritte-Swift' }
MAElementDescription class >> swiftType [
	^ 'Any'
]

{ #category : #'*Magritte-Swift' }
MAElementDescription >> swiftType [
	^ self propertyAt: #swiftType ifAbsent: [ self class swiftType ]
]

{ #category : #'*Magritte-Swift' }
MAElementDescription >> swiftType: aSymbol [
	self propertyAt: #swiftType put: aSymbol
]
