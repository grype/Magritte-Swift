Class {
	#name : #MASwiftCaseDeclaration,
	#superclass : #MASwiftAbstractDeclaration,
	#instVars : [
		'name',
		'isIndirect',
		'assignedValue'
	],
	#category : #'Magritte-Swift-Source'
}

{ #category : #'instance-creation' }
MASwiftCaseDeclaration class >> named: aString [
	^ self new name: aString asSymbol
]

{ #category : #accessing }
MASwiftCaseDeclaration >> assignedValue [
	^ assignedValue
]

{ #category : #accessing }
MASwiftCaseDeclaration >> assignedValue: anObject [
	assignedValue := anObject
]

{ #category : #initialization }
MASwiftCaseDeclaration >> initialize [
	super initialize.
	isIndirect := false
]

{ #category : #accessing }
MASwiftCaseDeclaration >> isIndirect [
	^ isIndirect
]

{ #category : #accessing }
MASwiftCaseDeclaration >> isIndirect: anObject [
	isIndirect := anObject
]

{ #category : #accessing }
MASwiftCaseDeclaration >> name [
	^ name
]

{ #category : #accessing }
MASwiftCaseDeclaration >> name: anObject [
	name := anObject
]

{ #category : #printing }
MASwiftCaseDeclaration >> printSwiftOn: aStream [
	(self printAttributesOn: aStream)
		ifTrue: [ aStream nextPut: Character space ].
	isIndirect
		ifTrue: [ aStream nextPutAll: 'indirect ' ].
	aStream
		nextPutAll: 'case ';
		nextPutAll: name.
	assignedValue
		ifNotNil: [ :val | 
			aStream nextPutAll: ' = '.
			assignedValue printSwiftOn: aStream ]
]
