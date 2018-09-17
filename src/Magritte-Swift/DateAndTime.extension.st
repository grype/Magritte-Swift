Extension { #name : #DateAndTime }

{ #category : #'*Magritte-Swift' }
DateAndTime >> printSwiftOn: aStream [
	aStream
		nextPutAll: ('Date(timeIntervalSince1970: {1})' format: OrderedCollection with: self asUnixTime)
]

{ #category : #'*Magritte-Swift' }
DateAndTime >> swiftOn: aRenderer [
	aRenderer dateAndTime: self
]
