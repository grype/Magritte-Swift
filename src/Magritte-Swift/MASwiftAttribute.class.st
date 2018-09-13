Class {
	#name : #MASwiftAttribute,
	#superclass : #MASwiftSourceObject,
	#instVars : [
		'name',
		'argumentClause'
	],
	#category : #'Magritte-Swift-Source'
}

{ #category : #'instance-creation' }
MASwiftAttribute class >> named: aName [
	^ self new
		name: aName;
		yourself
]

{ #category : #'instance-creation' }
MASwiftAttribute class >> named: aName argument: anArgumentExpression [
	^ self new
		name: aName;
		argument: anArgumentExpression;
		yourself
]

{ #category : #accessing }
MASwiftAttribute >> argumentClause [
	^ argumentClause
]

{ #category : #accessing }
MASwiftAttribute >> argumentClause: anObject [
	argumentClause := anObject
]

{ #category : #accessing }
MASwiftAttribute >> name [
	^ name
]

{ #category : #accessing }
MASwiftAttribute >> name: anObject [
	name := anObject
]

{ #category : #printing }
MASwiftAttribute >> printSwiftOn: aStream [
	aStream
		nextPut: $@;
		nextPutAll: name.
	argumentClause
		ifNotNil: [ :aStr | 
			aStream
				nextPut: $(;
				nextPutAll: aStr;
				nextPut: $) ]
]
