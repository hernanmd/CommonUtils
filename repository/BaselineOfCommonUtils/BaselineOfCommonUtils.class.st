Class {
	#name : #BaselineOfCommonUtils,
	#superclass : #BaselineOf,
	#category : #BaselineOfCommonUtils
}

{ #category : #baseline }
BaselineOfCommonUtils >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ 
			spec
				baseline: 'Grease'
				with: [ spec loads: #('Core'); repository: 'github://GsDevKit/Grease:master/repository' ];
				baseline: 'NeoCSV'
				with: [ spec repository: 'github://svenvc/NeoCSV/repository' ].

			spec package: 'CommonUtils' 			with: [ spec requires: #('Grease' 'NeoCSV') ].
			spec package: 'CommonUtils-Tests'		with: [ spec requires: 'CommonUtils' ].
					
			spec 
				group: 'default'	with: #('CommonUtils');
				group: 'Tests'		with: #('CommonUtils' 'CommonUtils-Tests') ].

	spec 
		for: #(#'pharo9.x') 
		do: [ 
			spec package: 'CommonUtils' with: [ spec requires: #('Grease' 'NeoCSV') ].
			spec package: 'CommonUtils-Pharo9' ].
]
