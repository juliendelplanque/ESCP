Class {
	#name : #BaselineOfESCP,
	#superclass : #BaselineOf,
	#category : 'BaselineOfESCP'
}

{ #category : #baselines }
BaselineOfESCP >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec
			package: #'ESCP' ]
]
