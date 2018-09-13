Class {
	#name : #MASwiftSourceTestCase,
	#superclass : #TestCase,
	#category : #'Magritte-Swift-Tests'
}

{ #category : #asserting }
MASwiftSourceTestCase >> assertDeclaration: aDeclaration prints: aString [
	| stream |
	stream := '' writeStream.
	aDeclaration printSwiftOn: stream.
	self assert: stream contents equals: aString
]
