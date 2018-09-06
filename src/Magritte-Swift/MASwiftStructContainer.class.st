Class {
	#name : #MASwiftStructContainer,
	#superclass : #MASwiftClassContainer,
	#category : #'Magritte-Swift-Core'
}

{ #category : #visiting }
MASwiftStructContainer >> acceptMagritte: aVisitor [
	aVisitor visitSwiftStructContainer: self
]
