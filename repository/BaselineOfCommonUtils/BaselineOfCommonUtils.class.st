Class {
	#name : #BaselineOfCommonUtils,
	#superclass : #BaselineOf,
	#category : #BaselineOfCommonUtils
}

{ #category : #baseline }
BaselineOfCommonUtils >> baseline: spec [
	<baseline>
	spec
		for: #(common)
		do: [ 
			self baselineForNeoCSV: spec.
			spec 
				package: 'CommonUtils' 
				with: [ spec requires: #('Grease' 'NeoCSV') ];
				package: 'CommonUtils-Tests'
				with: [ spec requires: 'CommonUtils' ].

			spec 
				for: #'pharo9.x' 
				do: [ 
					self baselineForGrease15: spec.
					spec package: 'CommonUtils' with: [ spec requires: #('CommonUtils-Pharo9') ].
					spec package: 'CommonUtils-Pharo9' ].
			spec 
				for: #(#'pharo10.x' #'pharo11.x')
				do: [ 
					self baselineForGrease19: spec.
					spec package: 'CommonUtils' with: [ spec requires: #('CommonUtils-Pharo9') ].
					spec package: 'CommonUtils-Pharo9' ].

			spec 
				group: 'default'	with: #('CommonUtils');
				group: 'Tests'		with: #('CommonUtils' 'CommonUtils-Tests') ]
]

{ #category : #baseline }
BaselineOfCommonUtils >> baselineForGrease15: spec [

	spec
		baseline: 'Grease'
		with: [ 
			spec 
				loads: #('Core'); 
				repository: 'github://SeasideSt/Grease:v1.5.x/repository' ]
]

{ #category : #baseline }
BaselineOfCommonUtils >> baselineForGrease19: spec [

	spec
		baseline: 'Grease'
		with: [ 
			spec 
				loads: #('Core'); 
				repository: 'github://SeasideSt/Grease:v1.9.x/repository' ]
]

{ #category : #baseline }
BaselineOfCommonUtils >> baselineForNeoCSV: spec [

	spec
		baseline: 'NeoCSV'
		with: [ 
			spec 
				loads: #('core');
				repository: 'github://svenvc/NeoCSV/repository' ].
]
