Class {
	#name : #MASwiftClassInitContainer,
	#superclass : #MAPriorityContainer,
	#category : #'Magritte-Swift-Core'
}

{ #category : #visiting }
MASwiftClassInitContainer >> acceptMagritte: aVisitor [
	aVisitor visitSwiftClassInitContainer: self
]
