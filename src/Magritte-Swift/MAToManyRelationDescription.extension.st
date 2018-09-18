Extension { #name : #MAToManyRelationDescription }

{ #category : #'*Magritte-Swift' }
MAToManyRelationDescription >> asSwiftVariableDeclaration [
	| swiftType swiftClassNames |

	swiftClassNames := self classes collect: [ :each | each swiftClassContainer swiftName ].
	swiftType := swiftClassNames size > 1
		ifTrue: [ MASwiftDictionaryType new
				keyType: swiftClassNames first asSymbol;
				valueType: swiftClassNames second asSymbol;
				yourself ]
		ifFalse: [ MASwiftArrayType new
				elementType: swiftClassNames first asSymbol;
				yourself ].
	swiftType isOptional: self isRequired not.

	^ MASwiftVariableDeclaration new
		name: self swiftName asSymbol;
		type: swiftType;
		yourself
]
