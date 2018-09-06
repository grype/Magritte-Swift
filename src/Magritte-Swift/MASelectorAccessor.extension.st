Extension { #name : #MASelectorAccessor }

{ #category : #'*Magritte-Swift' }
MASelectorAccessor >> swiftName [
	^self selector greaseString uncapitalized
]
