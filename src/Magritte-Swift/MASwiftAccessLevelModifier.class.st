Class {
	#name : #MASwiftAccessLevelModifier,
	#superclass : #MASwiftSourceObject,
	#instVars : [
		'name',
		'isSetterOnly'
	],
	#category : #'Magritte-Swift-Source'
}

{ #category : #'instance-creation' }
MASwiftAccessLevelModifier class >> fileprivate [
	^ self new
		name: 'fileprivate';
		yourself
]

{ #category : #'instance-creation' }
MASwiftAccessLevelModifier class >> fileprivateSet [
	^ self new
		name: 'fileprivate';
		isSetterOnly: true;
		yourself
]

{ #category : #'instance-creation' }
MASwiftAccessLevelModifier class >> internal [
	^ self new
		name: 'internal';
		yourself
]

{ #category : #'instance-creation' }
MASwiftAccessLevelModifier class >> internalSet [
	^ self new
		name: 'internal';
		isSetterOnly: true;
		yourself
]

{ #category : #'instance-creation' }
MASwiftAccessLevelModifier class >> open [
	^ self new
		name: 'open';
		yourself
]

{ #category : #'instance-creation' }
MASwiftAccessLevelModifier class >> openSet [
	^ self new
		name: 'open';
		isSetterOnly: true;
		yourself
]

{ #category : #'instance-creation' }
MASwiftAccessLevelModifier class >> private [
	^ self new
		name: 'private';
		yourself
]

{ #category : #'instance-creation' }
MASwiftAccessLevelModifier class >> privateSet [
	^ self new
		name: 'private';
		isSetterOnly: true;
		yourself
]

{ #category : #'instance-creation' }
MASwiftAccessLevelModifier class >> public [
	^ self new
		name: 'public';
		yourself
]

{ #category : #'instance-creation' }
MASwiftAccessLevelModifier class >> publicSet [
	^ self new
		name: 'public';
		isSetterOnly: true;
		yourself
]

{ #category : #initialization }
MASwiftAccessLevelModifier >> initialize [
	super initialize.
	isSetterOnly := false
]

{ #category : #accessing }
MASwiftAccessLevelModifier >> isSetterOnly [
	^ isSetterOnly
]

{ #category : #accessing }
MASwiftAccessLevelModifier >> isSetterOnly: anObject [
	isSetterOnly := anObject
]

{ #category : #accessing }
MASwiftAccessLevelModifier >> name [
	^ name
]

{ #category : #accessing }
MASwiftAccessLevelModifier >> name: anObject [
	name := anObject
]

{ #category : #printing }
MASwiftAccessLevelModifier >> printSwiftOn: aStream [
	aStream nextPutAll: name.
	isSetterOnly ifTrue: [ aStream nextPutAll: '(set)' ]
]
