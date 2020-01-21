Class {
	#name : #ILSlangTemporaryDeclarationNodesTranslator,
	#superclass : #ASTCTemporaryDeclarationNodesTranslator,
	#category : #'ASTC-Translation-ast-nodes'
}

{ #category : #translate }
ILSlangTemporaryDeclarationNodesTranslator >> translateNode: aTemporaryDeclarationNode [
	"We attempt to use the declaration generated by CCodeGen
	If it is absent, CCodeGenerator gives us a default case. 
	We currently ignore it and build a declaration from its type. "
	^ ((aTemporaryDeclarationNode methodNode propertyAt: #tNodeEquivalent) 
		declarationAt: aTemporaryDeclarationNode name ifAbsent: nil)
		ifNil: [ super translateNode: aTemporaryDeclarationNode ]
		ifNotNil: [:aStringDecl| 
			ASTCRawDeclaration new 
				rawDeclaration: aStringDecl;
				varName: aTemporaryDeclarationNode name;
				yourself ]
]