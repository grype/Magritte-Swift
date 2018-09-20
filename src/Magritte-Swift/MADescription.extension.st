Extension { #name : #MADescription }

{ #category : #'*Magritte-Swift' }
MADescription >> asSwiftVariableDeclaration [
	^ nil
]

{ #category : #'*Magritte-Swift' }
MADescription >> beSwiftCodable [
	self isSwiftCodable: true
]

{ #category : #'*Magritte-Swift' }
MADescription >> beSwiftSerialized [
	self isSwiftSerialized: true
]

{ #category : #'*Magritte-Swift' }
MADescription >> beSwiftStringConvertible [
	self isSwiftStringConvertible: true
]

{ #category : #'*Magritte-Swift' }
MADescription class >> defaultSwiftCodable [
	^ false
]

{ #category : #'*Magritte-Swift' }
MADescription >> defaultSwiftCodable [
	^self class defaultSwiftSerialized
]

{ #category : #'*Magritte-Swift' }
MADescription >> defaultSwiftCodingKey [
	^ self defaultSwiftName 
]

{ #category : #'*Magritte-Swift' }
MADescription >> defaultSwiftName [
	"Answer the default JSON element name."

	^ self accessor swiftName
]

{ #category : #'*Magritte-Swift' }
MADescription class >> defaultSwiftSerialized [
	^self defaultVisible
]

{ #category : #'*Magritte-Swift' }
MADescription >> defaultSwiftSerialized [
	^self class defaultSwiftSerialized
]

{ #category : #'*Magritte-Swift' }
MADescription >> defaultSwiftStringConvertible [
	^self class defaultSwiftStringConvertible
]

{ #category : #'*Magritte-Swift' }
MADescription class >> defaultSwiftStringConvertible [
	^ false
]

{ #category : #'*Magritte-Swift' }
MADescription class >> defaultSwiftWriter [
	^ MASwiftClassWriter
]

{ #category : #'*Magritte-Swift' }
MADescription >> isSwiftCodable [
	"Answer the JSON element name."

	^ self propertyAt: #isSwiftCodable ifAbsent: [ self defaultSwiftCodable ]
]

{ #category : #'*Magritte-Swift' }
MADescription >> isSwiftCodable: aBoolean [
	self propertyAt: #isSwiftCodable put: aBoolean
]

{ #category : #'*Magritte-Swift' }
MADescription >> isSwiftSerialized [
	"Answer whether the described object should be serialized to JSON."

	^ self propertyAt: #swiftSerialized ifAbsent: [ self defaultSwiftSerialized ]
]

{ #category : #'*Magritte-Swift' }
MADescription >> isSwiftSerialized: aBoolean [

	^ self propertyAt: #swiftSerialized put: aBoolean
]

{ #category : #'*Magritte-Swift' }
MADescription >> isSwiftStringConvertible [
	"Answer whether the described object should be serialized to JSON."

	^ self propertyAt: #swiftStringConvertible ifAbsent: [ self defaultSwiftStringConvertible ]
]

{ #category : #'*Magritte-Swift' }
MADescription >> isSwiftStringConvertible: aBoolean [

	^ self propertyAt: #swiftStringConvertible put: aBoolean
]

{ #category : #'*Magritte-Swift' }
MADescription >> swiftCodingKey [
	"Answer the JSON element name."

	^ self propertyAt: #swiftCodingKey ifAbsent: [ self defaultSwiftCodingKey ]
]

{ #category : #'*Magritte-Swift' }
MADescription >> swiftCodingKey: aString [
	self propertyAt: #swiftCodingKey put: aString
]

{ #category : #'*Magritte-Swift' }
MADescription >> swiftName [
	"Answer the JSON element name."

	^ self propertyAt: #swiftName ifAbsent: [ self defaultSwiftName ]
]

{ #category : #'*Magritte-Swift' }
MADescription >> swiftName: aString [
	self propertyAt: #swiftName put: aString
]

{ #category : #'*Magritte-Swift' }
MADescription >> swiftWriter [
	"Answer a Visitor that can be used to convert the model described by the receiver to a JSON string."

	^ self propertyAt: #swiftWriter ifAbsent: [ self class defaultSwiftWriter ]
]

{ #category : #'*Magritte-Swift' }
MADescription >> swiftWriter: aClass [
	"Answer a Visitor that can be used to convert the model described by the receiver to Swift."

	self propertyAt: #swiftWriter put: aClass
]

{ #category : #'*Magritte-Swift' }
MADescription >> writeSwiftDeclarationOf: anObject on: aRenderer [
	self swiftWriter write: anObject description: self to: aRenderer
]
