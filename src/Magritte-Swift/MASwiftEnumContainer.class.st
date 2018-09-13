Class {
	#name : #MASwiftEnumContainer,
	#superclass : #MASwiftClassContainer,
	#category : #'Magritte-Swift-Core'
}

{ #category : #visiting }
MASwiftEnumContainer >> acceptMagritte: aVisitor [
	aVisitor visitSwiftEnumContainer: self
]
