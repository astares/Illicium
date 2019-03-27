Trait {
	#name : #ASTCFormatTrait,
	#category : #'ASTC-Translation'
}

{ #category : #formatting }
ASTCFormatTrait >> formatSelector: aSelector [
	| functionName | 
	functionName:=aSelector asString.
	1 to:functionName size do:[:index | 
		(functionName at: index)=$: 
		ifTrue:[ functionName at:index put: Character space]
		].
	functionName:=functionName asCamelCase.
	^functionName uncapitalized.
]