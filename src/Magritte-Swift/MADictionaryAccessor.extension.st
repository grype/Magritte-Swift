Extension { #name : #MADictionaryAccessor }

{ #category : #'*Magritte-Swift' }
MADictionaryAccessor >> swiftName [
	^'[', self key greaseString, ']'
]
