Class {
	#name : #MASwiftRealmRoot,
	#superclass : #MASwiftRoot,
	#category : #'Magritte-Swift-Core'
}

{ #category : #initialization }
MASwiftRealmRoot >> initialize [
	super initialize.
	imports add: (MASwiftImportDeclaration named: #RealmSwift)
]
