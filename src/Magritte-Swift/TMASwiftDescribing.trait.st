Trait {
	#name : #TMASwiftDescribing,
	#category : #'Magritte-Swift-Core'
}

{ #category : #'magritte-swift-converting' }
TMASwiftDescribing classSide >> asSwift [
  ^ MASwiftCanvas builder
    fullDocument: true;
    rootClass: self swiftDocumentRootClass;
    render: self
]

{ #category : #testing }
TMASwiftDescribing classSide >> isSwiftSerializable [
	^ true
]

{ #category : #'magritte-swift-converting' }
TMASwiftDescribing classSide >> swiftClassContainer [
	| container |
	container := self magritteDescription swiftSerializableChildren
		isEmptyOrNil
		ifTrue: [ MASwiftClassContainer new
				swiftName: self swiftName;
				inheritsFrom: #(#Object);
				yourself ]
		ifFalse: [ (MASwiftClassContainer withAll: self magritteDescription children)
				swiftName: self swiftName;
				isSwiftSerialized: self isSwiftSerializable;
				yourself ].
	self superclass isSwiftSerializable
		ifTrue:
			[ container inheritsFrom: (Array with: self superclass swiftName) ].
	^ container
]

{ #category : #'magritte-swift-converting' }
TMASwiftDescribing classSide >> swiftDocumentRootClass [
	^ MASwiftRoot
]

{ #category : #'as yet unclassified' }
TMASwiftDescribing classSide >> swiftName [
	^ self name asSymbol
]
