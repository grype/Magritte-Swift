Class {
	#name : #MASwiftConformanceRequirement,
	#superclass : #MASwiftSourceObject,
	#instVars : [
		'type',
		'conformanceTypes'
	],
	#category : #'Magritte-Swift-Source'
}

{ #category : #accessing }
MASwiftConformanceRequirement >> conformanceTypes [
	^ conformanceTypes
]

{ #category : #accessing }
MASwiftConformanceRequirement >> conformanceTypes: anObject [
	conformanceTypes := anObject
]

{ #category : #printing }
MASwiftConformanceRequirement >> printSeparatorOn: aStream [
	aStream nextPutAll: ': '
]

{ #category : #printing }
MASwiftConformanceRequirement >> printSwiftOn: aStream [
	type printSwiftOn: aStream.
	self printSeparatorOn: aStream.
	conformanceTypes do: [ :each | each printSwiftOn: aStream ] separatedBy: [ aStream nextPutAll: ', ' ]
]

{ #category : #accessing }
MASwiftConformanceRequirement >> type [
	^ type
]

{ #category : #accessing }
MASwiftConformanceRequirement >> type: anObject [
	type := anObject
]
