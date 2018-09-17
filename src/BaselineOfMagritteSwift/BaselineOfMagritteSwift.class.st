Class {
	#name : #BaselineOfMagritteSwift,
	#superclass : #BaselineOf,
	#category : #BaselineOfMagritteSwift
}

{ #category : #baselines }
BaselineOfMagritteSwift >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec repository: 'github://grype/Magritte-Swift/src'.
			self setupDependenciesOn: spec.
			spec package: #'Magritte-Swift' with: [ spec requires: #('Magritte3') ].
			spec group: 'default' with: #('Magritte-Swift') ]
]

{ #category : #baselines }
BaselineOfMagritteSwift >> setupDependenciesOn: spec [
	spec
		configuration: 'Magritte3'
		with: [ spec
				versionString: '3.5.2';
				repository: 'http://smalltalkhub.com/mc/Magritte/Magritte3/main/' ]
]
