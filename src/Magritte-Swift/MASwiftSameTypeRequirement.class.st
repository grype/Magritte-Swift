Class {
	#name : #MASwiftSameTypeRequirement,
	#superclass : #MASwiftConformanceRequirement,
	#category : #'Magritte-Swift-Source'
}

{ #category : #printing }
MASwiftSameTypeRequirement >> printSeparatorOn: aStream [
	aStream nextPutAll: ' == '
]
