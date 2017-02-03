versions
version10: spec
	<version: '1.0' imports: #('0.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 1.0'.
		spec author: 'HernanMoralesDurand'.
		spec timestamp: '2/3/2017 22:05'.
		spec package: #CommonUtils with: 'CommonUtils-HernanMoralesDurand.1'. ].
