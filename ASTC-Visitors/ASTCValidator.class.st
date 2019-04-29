"
I represent a visitor that validate the types of the nodes use in an AST C.

I just answer if the AST C use the corrects types. To debug an AST, use my superClass ASTCValidatorDebug


- anASTCNode acceptVisitor: ASTCValidator new.


 Implementation Points
	I simply use my super class's visit, and catch any exception to return false. If the visit goes till the end, the AST is valid, and i return true.
"
Class {
	#name : #ASTCValidator,
	#superclass : #ASTCValidatorDebug,
	#category : #'ASTC-Visitors-validation'
}

{ #category : #visiting }
ASTCValidator >> visitASTCBlock: anASTCBlock [
	
	[super visitASTCBlock: anASTCBlock] on: Error do:[^false].
	^true
]

{ #category : #visiting }
ASTCValidator >> visitASTCCompilationUnit: anASTCCompilationUnit [

	[super visitASTCCompilationUnit: anASTCCompilationUnit] on: Error do:[^false].
	^true
]

{ #category : #visiting }
ASTCValidator >> visitASTCDeclaration: anASTCDeclaration [

	[super visitASTCDeclaration: anASTCDeclaration] on: Error do:[^false].
	^true
]

{ #category : #visiting }
ASTCValidator >> visitASTCDeclarationStatement: anASTCDeclarationStatement [

	[super visitASTCFunctionCall: anASTCDeclarationStatement ] on: Error do:[^false].
	^true
]

{ #category : #visiting }
ASTCValidator >> visitASTCExpression: anASTCExpression [

	[super visitASTCExpression: anASTCExpression] on: Error do:[^false].
	^true
]

{ #category : #visiting }
ASTCValidator >> visitASTCExpressionStatement: anASTCExpressionStatement [

	[super visitASTCExpressionStatement: anASTCExpressionStatement ] on: Error do:[^false].
	^true
]

{ #category : #visiting }
ASTCValidator >> visitASTCFunctionCall: anASTCFunctionCall [

	[super visitASTCFunctionCall: anASTCFunctionCall ] on: Error do:[^false].
	^true
]

{ #category : #visiting }
ASTCValidator >> visitASTCFunctionDefinition: anASTCFunctionDefinition [

	[super visitASTCFunctionDefinition: anASTCFunctionDefinition ] on: Error do:[^false].
	^true
]

{ #category : #visiting }
ASTCValidator >> visitASTCIdentifier: anASTCIdentifier [

	[super visitASTCIdentifier: anASTCIdentifier] on: Error do:[^false].
	^true
]

{ #category : #visiting }
ASTCValidator >> visitASTCIf: anASTCIf [

	[super visitASTCIf: anASTCIf] on: Error do:[^false].
	^true
]

{ #category : #visiting }
ASTCValidator >> visitASTCLiteral: anASTCLiteral [

	[super visitASTCLiteral: anASTCLiteral] on: Error do:[^false].
	^true
]

{ #category : #visiting }
ASTCValidator >> visitASTCNode: anASTCNode [

	[super visitASTCNode: anASTCNode] on: Error do:[^false].
	^true
]

{ #category : #visiting }
ASTCValidator >> visitASTCOperator: anASTCOperator [
	
	[super visitASTCOperator: anASTCOperator] on: Error do:[^false].
	^true
]

{ #category : #visiting }
ASTCValidator >> visitASTCProject: anASTCProject [

	[super visitASTCProject: anASTCProject] on: Error do:[^false].
	^true
]

{ #category : #visiting }
ASTCValidator >> visitASTCReturn: anASTCReturn [

	[super visitASTCReturn: anASTCReturn ] on: Error do:[^false].
	^true
]

{ #category : #visiting }
ASTCValidator >> visitASTCStatement: anASTCStatement [

	[super visitASTCStatement: anASTCStatement] on: Error do:[^false].
	^true
]

{ #category : #visiting }
ASTCValidator >> visitASTCType: anASTCType [

	[super visitASTCType: anASTCType] on: Error do:[^false].
	^true
]