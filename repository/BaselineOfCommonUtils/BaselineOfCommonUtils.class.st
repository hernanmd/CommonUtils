Class {
	#name : #BaselineOfCommonUtils,
	#superclass : #BaselineOf,
	#category : #BaselineOfCommonUtils
}

{ #category : #baselines }
BaselineOfCommonUtils >> baseline: spec [
	<baseline>
	spec
		for: #(common)
		do: [ 
			spec
				baseline: 'Grease'
				with: [ 
					spec 
						loads: #('Core'); 
						repository: 'github://SeasideSt/Grease:v1.5.x/repository' ];

				baseline: 'NeoCSV'
				with: [ 
					spec 
						loads: #('core');
						repository: 'github://svenvc/NeoCSV:v15/repository' ].

			spec 
				package: 'CommonUtils' 			with: [ spec requires: #('Grease' 'NeoCSV') ];
				package: 'CommonUtils-Tests'	with: [ spec requires: 'CommonUtils' ].

			spec 
				for: #'pharo9.x' 
				do: [ 
					spec package: 'CommonUtils' with: [ spec requires: #('CommonUtils-Pharo9') ].
					spec package: 'CommonUtils-Pharo9' ].
				
			spec 
				for: #(#'pharo10.x' #'pharo11.x')
				do: [ 
					spec package: 'CommonUtils' with: [ spec requires: #('CommonUtils-Pharo9') ].
					spec package: 'CommonUtils-Pharo9' ].

			spec 
				group: 'default'	with: #('CommonUtils');
				group: 'Tests'		with: #('CommonUtils' 'CommonUtils-Tests') ]
]
