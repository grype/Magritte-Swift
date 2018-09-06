Extension { #name : #MAVariableAccessor }

{ #category : #'*Magritte-Swift' }
MAVariableAccessor >> swiftName [
	^self name greaseString uncapitalized
]
