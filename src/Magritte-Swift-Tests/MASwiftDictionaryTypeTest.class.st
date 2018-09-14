Class {
	#name : #MASwiftDictionaryTypeTest,
	#superclass : #MASwiftSourceTestCase,
	#category : #'Magritte-Swift-Tests'
}

{ #category : #tests }
MASwiftDictionaryTypeTest >> testPrintSwiftOn [
	| declaration |

	declaration := MASwiftDictionaryType new
		keyType: #Key;
		valueType: #Value;
		yourself.
	self assertDeclaration: declaration prints: '[Key:Value]'.

	declaration := MASwiftDictionaryType new
		keyType: #AnyHashable;
		valueType:
			(MASwiftType new
				name: #Array;
				genericParameters: #(#String);
				yourself);
		yourself.
	self assertDeclaration: declaration prints: '[AnyHashable:Array<String>]'
]
