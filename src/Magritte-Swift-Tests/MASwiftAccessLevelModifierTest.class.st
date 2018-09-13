Class {
	#name : #MASwiftAccessLevelModifierTest,
	#superclass : #MASwiftSourceTestCase,
	#category : #'Magritte-Swift-Tests'
}

{ #category : #tests }
MASwiftAccessLevelModifierTest >> testPrintSwiftOn [
	| declaration |

	declaration := MASwiftAccessLevelModifier new
		name: 'private';
		yourself.
	self assertDeclaration: declaration prints: 'private'.
	declaration isSetterOnly: true.
	self assertDeclaration: declaration prints: 'private(set)'
]
