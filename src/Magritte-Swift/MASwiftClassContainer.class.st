Class {
	#name : #MASwiftClassContainer,
	#superclass : #MAPriorityContainer,
	#category : #'Magritte-Swift-Core'
}

{ #category : #visiting }
MASwiftClassContainer >> acceptMagritte: aVisitor [
	aVisitor visitSwiftClassContainer: self
]

{ #category : #'accessing-children' }
MASwiftClassContainer >> childCodableContainer [
	| codableDescriptions |

	codableDescriptions := self swiftCodableChildren sort: [ :a :b | a priority < b priority ].
	codableDescriptions isEmptyOrNil
		ifTrue: [ ^ nil ].
		
	^ (MASwiftEnumContainer withAll: codableDescriptions)
				swiftName: #Codable;
				inheritsFrom: #(#String #CodingKey);
				yourself
]

{ #category : #'accessing-children' }
MASwiftClassContainer >> childContainers [
	^ (OrderedCollection new
		add: self childInitContainer;
		add: self childCodableContainer;
		add: self childStringConvertibleContainer;
		yourself) select: #isNotNil
]

{ #category : #'accessing-children' }
MASwiftClassContainer >> childInitContainer [
	| requiredDescriptions |

	requiredDescriptions := self swiftSerializableRequiredChildren sort: [ :a :b | a priority < b priority ].
	^ requiredDescriptions isEmptyOrNil
		ifTrue: [ nil ]
		ifFalse: [ MASwiftClassInitContainer withAll: requiredDescriptions ]
]

{ #category : #'accessing-children' }
MASwiftClassContainer >> childStringConvertibleContainer [
	| stringConvertibleDescriptions declaration variableInfos returnDescriptionExpression |

	stringConvertibleDescriptions := self swiftStringConvertibleChildren sort: [ :a :b | a priority < b priority ].
	(stringConvertibleDescriptions isEmptyOrNil and: [ self isSwiftStringConvertible not ])
		ifTrue: [ ^ nil ].

	declaration := MASwiftVariableDeclaration new
		name: #description;
		type: #String;
		yourself.

	variableInfos := stringConvertibleDescriptions
		collect: [ :each | '{1}: \\(String(reflecting: {1}))' format: {each swiftName} ].

	returnDescriptionExpression := MASwiftReturnExpression new
		expression:
			('{1}({2})'
				format:
					{self swiftName.
					(variableInfos joinUsing: '; ')});
		yourself.

	^ MASwiftDeclarationContainer
		with: declaration
		children: (OrderedCollection with: returnDescriptionExpression)
]

{ #category : #testing }
MASwiftClassContainer >> hasCodableChildren [
	^ self swiftCodableChildren isEmptyOrNil not
]

{ #category : #testing }
MASwiftClassContainer >> hasStringConvertibleChildren [
	^ self swiftStringConvertibleChildren isEmptyOrNil not
]

{ #category : #accessing }
MASwiftClassContainer >> inheritsFrom [
	^ self propertyAt: #inheritsFrom ifAbsent: [ nil ]
]

{ #category : #accessing }
MASwiftClassContainer >> inheritsFrom: aCollection [
	self propertyAt: #inheritsFrom put: aCollection
]
