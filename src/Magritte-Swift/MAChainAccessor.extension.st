Extension { #name : #MAChainAccessor }

{ #category : #'*Magritte-Swift' }
MAChainAccessor >> swiftName [
	^(self accessor selector greaseString capitalized, '.', self next swiftName)
]
