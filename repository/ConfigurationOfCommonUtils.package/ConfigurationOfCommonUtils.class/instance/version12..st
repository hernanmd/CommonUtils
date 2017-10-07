versions
version12: spec
	<version: '1.2' imports: #('0.2-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 1.2'.
		spec author: 'HernanMoralesDurand'.
		spec timestamp: '10/7/2017 18:10'.
		spec project: 'Grease' with: '1.3.0'.
		spec package: #CommonUtils with: 'CommonUtils-HernanMoralesDurand.9'. ].
