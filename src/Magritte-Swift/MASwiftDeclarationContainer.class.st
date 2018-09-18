Class {
	#name : #MASwiftDeclarationContainer,
	#superclass : #MAPriorityContainer,
	#instVars : [
		'declaration',
		'childDeclarations'
	],
	#category : #'Magritte-Swift-Core'
}

{ #category : #'instance-creation' }
MASwiftDeclarationContainer class >> with: aDeclaration [
	^ self new
		declaration: aDeclaration;
		yourself
]

{ #category : #'instance-creation' }
MASwiftDeclarationContainer class >> with: aDeclaration children: aCollectionOfDeclarations [
	^ self new
		declaration: aDeclaration;
		childDeclarations: aCollectionOfDeclarations;
		yourself
]

{ #category : #visiting }
MASwiftDeclarationContainer >> acceptMagritte: aVisitor [
	aVisitor visitSwiftDeclarationContainer: self
]

{ #category : #accessing }
MASwiftDeclarationContainer >> childDeclarations [
	^ childDeclarations
]

{ #category : #accessing }
MASwiftDeclarationContainer >> childDeclarations: anObject [
	childDeclarations := anObject
]

{ #category : #accessing }
MASwiftDeclarationContainer >> declaration [
	^ declaration
]

{ #category : #accessing }
MASwiftDeclarationContainer >> declaration: anObject [
	declaration := anObject
]

{ #category : #initialization }
MASwiftDeclarationContainer >> initialize [
	super initialize
]
