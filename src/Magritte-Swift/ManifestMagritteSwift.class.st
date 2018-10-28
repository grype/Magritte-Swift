"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestMagritteSwift,
	#superclass : #PackageManifest,
	#category : #'Magritte-Swift-Manifest'
}

{ #category : #'code-critics' }
ManifestMagritteSwift class >> ruleRBModifiesCollectionRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#ClyExportSwiftCommand #execute #false)) #'2018-10-27T20:23:32.612984-07:00') )
]
