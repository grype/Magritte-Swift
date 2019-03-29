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
				swiftName: self name asSymbol;
				inheritsFrom: #(#Object);
				yourself ]
		ifFalse: [ (MASwiftClassContainer withAll: self magritteDescription children)
				swiftName: self name asSymbol;
				isSwiftSerialized: self isSwiftSerializable;
				yourself ].
	self superclass isSwiftSerializable
		ifTrue:
			[ container inheritsFrom: (Array with: self superclass name asSymbol) ].
	^ container
]

{ #category : #'magritte-swift-converting' }
TMASwiftDescribing classSide >> swiftDocumentRootClass [
	^ MASwiftRoot
]
