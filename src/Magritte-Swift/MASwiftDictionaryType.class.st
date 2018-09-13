Class {
	#name : #MASwiftDictionaryType,
	#superclass : #MASwiftAbstractType,
	#instVars : [
		'keyType',
		'valueType'
	],
	#category : #'Magritte-Swift-Source'
}

{ #category : #accessing }
MASwiftDictionaryType >> keyType [
	^ keyType
]

{ #category : #accessing }
MASwiftDictionaryType >> keyType: anObject [
	keyType := anObject
]

{ #category : #writing }
MASwiftDictionaryType >> printSwiftOn: aStream [
	aStream nextPut: $[.
	keyType printSwiftOn: aStream.
	aStream nextPut: $:.
	valueType printSwiftOn: aStream.
	aStream nextPut: $].
	self printOptionalOn: aStream
]

{ #category : #tests }
MASwiftDictionaryType >> testPrintSwiftOn [
]

{ #category : #accessing }
MASwiftDictionaryType >> valueType [
	^ valueType
]

{ #category : #accessing }
MASwiftDictionaryType >> valueType: anObject [
	valueType := anObject
]
