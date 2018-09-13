Class {
	#name : #MASwiftFunctionSignature,
	#superclass : #MASwiftSourceObject,
	#instVars : [
		'parameters',
		'throws',
		'rethrows',
		'result'
	],
	#category : #'Magritte-Swift-Source'
}

{ #category : #initialization }
MASwiftFunctionSignature >> initialize [
	super initialize.
	throws := false.
	rethrows := false
]

{ #category : #accessing }
MASwiftFunctionSignature >> parameters [
	^ parameters
]

{ #category : #accessing }
MASwiftFunctionSignature >> parameters: anObject [
	parameters := anObject
]

{ #category : #printing }
MASwiftFunctionSignature >> printParametersOn: aStream [
	parameters
		ifNotNil: [ :params | 
			params
				do: [ :each | each printSwiftOn: aStream ]
				separatedBy: [ aStream nextPutAll: ', ' ] ]
]

{ #category : #printing }
MASwiftFunctionSignature >> printSwiftOn: aStream [
	aStream nextPut: $(.
	self printParametersOn: aStream.
	aStream nextPut: $).
	throws
		ifTrue: [ aStream nextPutAll: ' throws' ].
	rethrows
		ifTrue: [ aStream nextPutAll: ' rethrows' ].
	result
		ifNotNil: [ :aResult | 
			aStream nextPutAll: ' -> '.
			aResult printSwiftOn: aStream ]
]

{ #category : #accessing }
MASwiftFunctionSignature >> result [
	^ result
]

{ #category : #accessing }
MASwiftFunctionSignature >> result: anObject [
	result := anObject
]

{ #category : #accessing }
MASwiftFunctionSignature >> rethrows [
	^ rethrows
]

{ #category : #accessing }
MASwiftFunctionSignature >> rethrows: anObject [
	rethrows := anObject
]

{ #category : #accessing }
MASwiftFunctionSignature >> throws [
	^ throws
]

{ #category : #accessing }
MASwiftFunctionSignature >> throws: anObject [
	throws := anObject
]
