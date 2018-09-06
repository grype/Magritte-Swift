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

{ #category : #writing }
MASwiftFunctionSignature >> writeOn: aStream [
	aStream nextPut: $(.
	self writeParametersOn: aStream.
	aStream nextPut: $).
	throws ifTrue: [ aStream nextPutAll: ' throws' ].
	rethrows ifTrue: [ aStream nextPutAll: ' rethrows' ].
	result ifNotNil: [ :aResult | aResult writeOn: aStream ].
	
]

{ #category : #writing }
MASwiftFunctionSignature >> writeParametersOn: aStream [
	parameters
		ifNotNil: [ :params | 
			params
				do: [ :each | each writeOn: aStream ]
				separatedBy: [ aStream nextPutAll: ', ' ] ]
]
