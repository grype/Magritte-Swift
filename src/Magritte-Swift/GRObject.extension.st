Extension { #name : #GRObject }

{ #category : #'*Magritte-Swift' }
GRObject class >> asSwift [
	^ MASwiftCanvas builder
		fullDocument: true;
		rootClass: MASwiftRoot;
		render: self
]

{ #category : #'*Magritte-Swift' }
GRObject class >> swiftClassDescription [
	^ (MASwiftClassContainer withAll: self magritteDescription children)
		swiftName: self name asSymbol;
		yourself.
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

{ #category : #'*Magritte-Swift' }
GRObject class >> swiftOn: aRenderer [
	| description |

	description := self swiftClassDescription.
	description ifNil: [ ^ self ].
	description swiftWriter write: self description: description to: aRenderer
]
