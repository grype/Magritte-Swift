Extension { #name : #GRObject }

{ #category : #'*Magritte-Swift' }
GRObject class >> asSwift [
	^ MASwiftCanvas builder
		fullDocument: true;
		rootClass: MASwiftRoot;
		render: self
]

{ #category : #'*Magritte-Swift' }
GRObject class >> isSwiftSerializable [
	^ false
]

{ #category : #'*Magritte-Swift' }
GRObject class >> swiftClassContainer [
	^ (MASwiftClassContainer withAll: self magritteDescription children)
		swiftName: self name asSymbol;
		isSwiftSerialized: self isSwiftSerializable;
		yourself
]

{ #category : #'*Magritte-Swift' }
GRObject class >> swiftOn: aRenderer [
	| description |

	description := self swiftClassContainer.
	description ifNil: [ ^ self ].
	description swiftWriter write: self description: description to: aRenderer
]

{ #category : #'*Magritte-Swift' }
GRObject >> swiftOn: aRenderer [
	| description |
	description := self magritteDescription.
	description swiftWriter
		write: self
		description: description
		to: aRenderer
]
