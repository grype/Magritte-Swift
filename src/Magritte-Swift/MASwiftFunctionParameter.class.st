Class {
	#name : #MASwiftFunctionParameter,
	#superclass : #MASwiftSourceObject,
	#instVars : [
		'name',
		'localName',
		'type',
		'defaultValue'
	],
	#category : #'Magritte-Swift-Source'
}

{ #category : #accessing }
MASwiftFunctionParameter >> defaultValue [
	^ defaultValue
]

{ #category : #accessing }
MASwiftFunctionParameter >> defaultValue: anObject [
	defaultValue := anObject
]

{ #category : #accessing }
MASwiftFunctionParameter >> localName [
	^ localName
]

{ #category : #accessing }
MASwiftFunctionParameter >> localName: anObject [
	localName := anObject
]

{ #category : #accessing }
MASwiftFunctionParameter >> name [
	^ name
]

{ #category : #accessing }
MASwiftFunctionParameter >> name: anObject [
	name := anObject
]

{ #category : #accessing }
MASwiftFunctionParameter >> type [
	^ type
]

{ #category : #accessing }
MASwiftFunctionParameter >> type: anObject [
	type := anObject
]

{ #category : #writing }
MASwiftFunctionParameter >> writeOn: aStream [
	aStream nextPutAll: name.
	localName
		ifNotNil: [ :val | 
			aStream
				nextPut: Character space;
				nextPutAll: val ].
	aStream nextPutAll: ': '.
	type writeOn: aStream.
	defaultValue
		ifNotNil: [ :val | 
			aStream
				nextPutAll: ' = ';
				nextPutAll: val ]
]
