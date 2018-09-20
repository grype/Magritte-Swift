Class {
	#name : #ClyExportSwiftCommand,
	#superclass : #CmdCommand,
	#instVars : [
		'targetClasses'
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

	targetClasses
		do: [ :aCls | 
			fileReference := (dir / aCls swiftClassContainer swiftName greaseString , 'swift') nextVersion.
			fileReference binaryWriteStream
				nextPutAll: aCls asSwift;
				close ]
]

{ #category : #execution }
ClyExportSwiftCommand >> prepareFullExecutionInContext: aBrowserContext [
	super prepareFullExecutionInContext: aBrowserContext.
	
	targetClasses := aBrowserContext selectedClasses
		select: [ :each | self class isClassSerializable: each ]
]
