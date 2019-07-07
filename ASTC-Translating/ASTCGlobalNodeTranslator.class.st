Class {
	#name : #ASTCGlobalNodeTranslator,
	#superclass : #ASTCNodeTranslator,
	#category : #'ASTC-Translating-Methods'
}

{ #category : #translate }
ASTCGlobalNodeTranslator >> translateNode: aGlobalNode withMainTranslator: aTranslator [
	(aGlobalNode methodNode methodClass
		hasClassVarNamed: aGlobalNode name)
		ifTrue: [ self error: 'Global/Pool variables are not supported.' ].
	(aGlobalNode parent isAssignment
		and: [ aGlobalNode parent variable = aGlobalNode ])
		ifTrue: [ self error: ' ClassVariables are read only in Limited Pharo.' ].
	^ ASTCIdentifier new
		id: aGlobalNode name;
		yourself
]