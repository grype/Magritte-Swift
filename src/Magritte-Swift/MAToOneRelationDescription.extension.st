Extension { #name : #MAToOneRelationDescription }

{ #category : #'*Magritte-Swift' }
MAToOneRelationDescription >> asSwiftVariableDeclaration [
	^ MASwiftVariableDeclaration new
		name: self swiftName asSymbol;
		type:
			(MASwiftType new
				name: self classes first swiftClassDescription swiftName asSymbol;
				isOptional: self isRequired not;
				yourself);
		yourself
]
