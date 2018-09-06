Class {
	#name : #MASwiftClassContainer,
	#superclass : #MAPriorityContainer,
	#category : #'Magritte-Swift-Core'
}

{ #category : #visiting }
MASwiftClassContainer >> acceptMagritte: aVisitor [
	aVisitor visitSwiftClassContainer: self
]

{ #category : #accessing }
MASwiftClassContainer >> inheritsFrom [
	^ self propertyAt: #inheritsFrom ifAbsent: [ nil ]
]

{ #category : #accessing }
MASwiftClassContainer >> inheritsFrom: aCollection [
	self propertyAt: #inheritsFrom put: aCollection
]
