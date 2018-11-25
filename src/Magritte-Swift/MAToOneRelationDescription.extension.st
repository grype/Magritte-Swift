Extension { #name : #MAToOneRelationDescription }

{ #category : #'*Magritte-Swift' }
MAToOneRelationDescription >> asSwiftVariableDeclaration [
	^ self swiftVariableDeclarationClass new
		name: self swiftName asSymbol;
		declarationModifiers: self swiftDeclarationModifiers;
		initializingExpression: self swiftDefaultValue;
		type:
			(MASwiftType new
				name: self classes first swiftClassContainer swiftName asSymbol;
				isOptional: self isRequired not;
				yourself);
		yourself
]
