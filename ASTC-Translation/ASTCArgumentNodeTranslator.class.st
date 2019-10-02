Class {
	#name : #ASTCArgumentNodeTranslator,
	#superclass : #ASTCNodeTranslator,
	#category : #'ASTC-Translation-Methods'
}

{ #category : #translate }
ASTCArgumentNodeTranslator >> translateNode: anArgumentNode withMethodTranslator: aTranslator [
	| argIdentifier |
	argIdentifier := ASTCIdentifier new
		id: anArgumentNode name;
		yourself.
	^ anArgumentNode parent isMethod
		ifTrue: [ 
			ASTCVariableDeclaration new
				id: argIdentifier;
				type:
					(ASTCType new
						type: (aTranslator getNodeTranslationType: anArgumentNode);
						yourself);
				yourself.
			]
		ifFalse: [ 
				argIdentifier.
			]
]