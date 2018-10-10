baseline
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ 
			spec
				baseline: 'Grease'
				with: [ spec loads: #('Core'); repository: 'github://GsDevKit/Grease:master/repository' ].
			spec package: 'CommonUtils' 			with: [ spec requires: 'Grease' ].
			spec package: 'CommonUtils-Tests'		with: [ spec requires: 'CommonUtils' ].
					
			spec 
				group: 'default' with: #('CommonUtils');
				group: 'Tests'		with: #('CommonUtils' CommonUtils-Tests) ]