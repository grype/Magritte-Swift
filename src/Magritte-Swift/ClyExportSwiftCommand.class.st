Class {
	#name : #ClyExportSwiftCommand,
	#superclass : #CmdCommand,
	#instVars : [
		'targetClasses',
		'overwriteAll'
	],
	#category : #'Magritte-Swift-Commands'
}

{ #category : #activation }
ClyExportSwiftCommand class >> browserMenuActivation [
	<classAnnotation>
	
	^CmdContextMenuActivation byItemOf: CmdExtraMenuGroup for: ClySystemBrowserContext
]

{ #category : #activation }
ClyExportSwiftCommand class >> canBeExecutedInContext: aToolContext [
	^ self doesContextContainExportableClasses: aToolContext 
]

{ #category : #testing }
ClyExportSwiftCommand class >> doesContextContainExportableClasses: aContext [
	^ aContext selectedClasses
		detect: [ :each | self isClassSerializable: each ]
		ifFound: [ true ]
		ifNone: [ false ]
]

{ #category : #testing }
ClyExportSwiftCommand class >> isClassSerializable: aClass [
	^ (aClass respondsTo: #isSwiftSerializable) and: [ aClass isSwiftSerializable ]
]

{ #category : #execution }
ClyExportSwiftCommand >> confirmOverwriteFile: aFileReference [
	^ UIManager default
		confirm: ('Overwrite file at: "{1}" ?' format: {aFileReference fullName})
		label: 'File exists'
]

{ #category : #accessing }
ClyExportSwiftCommand >> defaultMenuItemName [
	^ 'Export as Swift'
]

{ #category : #accessing }
ClyExportSwiftCommand >> description [
	^ 'Exports swift representation of a selected class'
]

{ #category : #execution }
ClyExportSwiftCommand >> execute [
	| dir fileReference |

	dir := UIManager default
		chooseDirectory: 'Please select where you want to save swift files'
		from: FileSystem workingDirectory.

	dir ifNil: [ ^ self ].
	dir := dir asFileReference.
	overwriteAll := nil.

	targetClasses
		do: [ :aCls | 
			fileReference := dir / aCls swiftClassContainer swiftName greaseString , 'swift'.
			fileReference := self
				validateFileReference: fileReference
				applyToAll: (targetClasses size > 1 and: [ aCls == targetClasses first ]).
			fileReference binaryWriteStream
				truncate;
				nextPutAll: aCls asSwift;
				close ]
]

{ #category : #execution }
ClyExportSwiftCommand >> prepareFullExecutionInContext: aBrowserContext [
	super prepareFullExecutionInContext: aBrowserContext.
	
	targetClasses := aBrowserContext selectedClasses
		select: [ :each | self class isClassSerializable: each ]
]

{ #category : #execution }
ClyExportSwiftCommand >> validateFileReference: aFileReference applyToAll: applyToAll [
	| response |

	aFileReference exists
		ifFalse: [ ^ aFileReference ].

	overwriteAll
		ifNotNil: [ :val | 
			val
				ifTrue: [ ^ aFileReference ]
				ifFalse: [ ^ aFileReference nextVersion ] ].

	response := self confirmOverwriteFile: aFileReference.
	applyToAll
		ifTrue: [ (UIManager default confirm: 'Apply to all')
				ifTrue: [ overwriteAll := response ] ].
			
	^ response
		ifTrue: [ aFileReference ]
		ifFalse: [ aFileReference nextVersion ]
]
