Class {
	#name : #MASwiftFunctionAttribute,
	#superclass : #MASwiftSourceObject,
	#instVars : [
		'name',
		'argumentClause'
	],
	#category : #'Magritte-Swift-Source'
}

{ #category : #accessing }
MASwiftFunctionAttribute >> argumentClause [
	^ argumentClause
]

{ #category : #accessing }
MASwiftFunctionAttribute >> argumentClause: anObject [
	argumentClause := anObject
]

{ #category : #accessing }
MASwiftFunctionAttribute >> name [
	^ name
]

{ #category : #accessing }
MASwiftFunctionAttribute >> name: anObject [
	name := anObject
]

{ #category : #writing }
MASwiftFunctionAttribute >> writeOn: aStream [
	aStream
		nextPut: $@;
		nextPutAll: name.
	argumentClause ifNotNil: [ :aStr | aStream nextPutAll: aStr ]
]
