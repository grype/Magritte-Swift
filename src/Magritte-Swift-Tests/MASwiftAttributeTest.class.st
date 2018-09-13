Class {
	#name : #MASwiftAttributeTest,
	#superclass : #MASwiftSourceTestCase,
	#category : #'Magritte-Swift-Tests'
}

{ #category : #tests }
MASwiftAttributeTest >> testPrintSwiftOn [
	| declaration |
	
	declaration := MASwiftAttribute new name: 'objc'; yourself.
	self assertDeclaration: declaration prints: '@objc'.
	
	declaration := MASwiftAttribute new name: 'available'; argumentClause: 'iOS 10.0'; yourself.
	self assertDeclaration: declaration prints: '@available(iOS 10.0)'
]
