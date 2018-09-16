Extension { #name : #MAElementDescription }

{ #category : #'*Magritte-Swift' }
MAElementDescription >> asSwiftVariableDeclaration [
	^ self class swiftType
		ifNotNil: [ :swiftType | 
			MASwiftVariableDeclaration new
				name: self swiftName asSymbol;
				type:
					(MASwiftType new
						name: swiftType asSymbol;
						isOptional: self isRequired not;
						yourself);
				yourself ]
]

{ #category : #'*Magritte-Swift' }
MAElementDescription class >> swiftType [
	^ 'Any'
]
