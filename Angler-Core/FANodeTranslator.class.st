Class {
	#name : #FANodeTranslator,
	#superclass : #Object,
	#instVars : [
		'methodTranslator'
	],
	#category : #'Angler-Core-nodes-translators'
}

{ #category : #translate }
FANodeTranslator >> methodTranslator [
	^ methodTranslator
]

{ #category : #translate }
FANodeTranslator >> methodTranslator: aMethodTranslator [
	methodTranslator := aMethodTranslator
]

{ #category : #'as yet unclassified' }
FANodeTranslator >> stateName [
	^ methodTranslator stateName
]

{ #category : #translate }
FANodeTranslator >> translateNode: aNode [
	self subclassResponsibility
]