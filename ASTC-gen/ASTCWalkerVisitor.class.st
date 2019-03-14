Class {
	#name : #ASTCWalkerVisitor,
	#superclass : #ASTCVisitor,
	#category : #'ASTC-gen'
}

{ #category : #visiting }
ASTCWalkerVisitor >> visitASTCBlock: anASTCBlock [
	self walkASTCBlock: anASTCBlock.
			
]

{ #category : #visiting }
ASTCWalkerVisitor >> visitASTCCompilationUnit: anASTCCompilationUnit [
	self walkASTCCompilationUnit: anASTCCompilationUnit.
			
]

{ #category : #visiting }
ASTCWalkerVisitor >> visitASTCDeclaration: anASTCDeclaration [
	self walkASTCDeclaration: anASTCDeclaration.
			
]

{ #category : #visiting }
ASTCWalkerVisitor >> visitASTCExpression: anASTCExpression [
	self walkASTCExpression: anASTCExpression.
			
]

{ #category : #visiting }
ASTCWalkerVisitor >> visitASTCExpressionStatement: anASTCExpressionStatement [
	self walkASTCExpressionStatement: anASTCExpressionStatement.
			
]

{ #category : #visiting }
ASTCWalkerVisitor >> visitASTCFunctionCall: anASTCFunctionCall [
	self walkASTCFunctionCall: anASTCFunctionCall.
			
]

{ #category : #visiting }
ASTCWalkerVisitor >> visitASTCFunctionDefinition: anASTCFunctionDefinition [
	self walkASTCFunctionDefinition: anASTCFunctionDefinition.
			
]

{ #category : #visiting }
ASTCWalkerVisitor >> visitASTCIdentifier: anASTCIdentifier [
	self walkASTCIdentifier: anASTCIdentifier.
			
]

{ #category : #visiting }
ASTCWalkerVisitor >> visitASTCIf: anASTCIf [
	self walkASTCIf: anASTCIf.
			
]

{ #category : #visiting }
ASTCWalkerVisitor >> visitASTCLiteral: anASTCLiteral [
	self walkASTCLiteral: anASTCLiteral.
			
]

{ #category : #visiting }
ASTCWalkerVisitor >> visitASTCNode: anASTCNode [
	self walkASTCNode: anASTCNode.
			
]

{ #category : #visiting }
ASTCWalkerVisitor >> visitASTCOperator: anASTCOperator [
	self walkASTCOperator: anASTCOperator.
			
]

{ #category : #visiting }
ASTCWalkerVisitor >> visitASTCProject: anASTCProject [
	self walkASTCProject: anASTCProject.
			
]

{ #category : #visiting }
ASTCWalkerVisitor >> visitASTCReturn: anASTCReturn [
	self walkASTCReturn: anASTCReturn.
			
]

{ #category : #visiting }
ASTCWalkerVisitor >> visitASTCStatement: anASTCStatement [
	self walkASTCStatement: anASTCStatement.
			
]

{ #category : #visiting }
ASTCWalkerVisitor >> visitASTCType: anASTCType [
	self walkASTCType: anASTCType.
			
]

{ #category : #visiting }
ASTCWalkerVisitor >> walkASTCBlock: anASTCBlock [
	self walkASTCBlockStatements:anASTCBlock.
	self walkASTCBlockDeclarations:anASTCBlock.
	
]

{ #category : #walking }
ASTCWalkerVisitor >> walkASTCBlockDeclarations:anASTCBlock [
  ^anASTCBlock declarations do:[:child| child acceptVisitor:self].
]

{ #category : #walking }
ASTCWalkerVisitor >> walkASTCBlockStatements:anASTCBlock [
  ^anASTCBlock statements do:[:child| child acceptVisitor:self].
]

{ #category : #visiting }
ASTCWalkerVisitor >> walkASTCCompilationUnit: anASTCCompilationUnit [
	self walkASTCCompilationUnitParent:anASTCCompilationUnit.
	self walkASTCCompilationUnitFunctionDefinitions:anASTCCompilationUnit.
	
]

{ #category : #walking }
ASTCWalkerVisitor >> walkASTCCompilationUnitFunctionDefinitions:anASTCCompilationUnit [
  ^anASTCCompilationUnit functionDefinitions do:[:child| child acceptVisitor:self].
]

{ #category : #walking }
ASTCWalkerVisitor >> walkASTCCompilationUnitParent:anASTCCompilationUnit [
  ^anASTCCompilationUnit parent acceptVisitor:self.
]

{ #category : #visiting }
ASTCWalkerVisitor >> walkASTCDeclaration: anASTCDeclaration [
	self walkASTCDeclarationInit:anASTCDeclaration.
	self walkASTCDeclarationType:anASTCDeclaration.
	self walkASTCDeclarationIds:anASTCDeclaration.
	
]

{ #category : #walking }
ASTCWalkerVisitor >> walkASTCDeclarationIds:anASTCDeclaration [
  ^anASTCDeclaration ids do:[:child| child acceptVisitor:self].
]

{ #category : #walking }
ASTCWalkerVisitor >> walkASTCDeclarationInit:anASTCDeclaration [
  ^anASTCDeclaration init acceptVisitor:self.
]

{ #category : #walking }
ASTCWalkerVisitor >> walkASTCDeclarationType:anASTCDeclaration [
  ^anASTCDeclaration type acceptVisitor:self.
]

{ #category : #visiting }
ASTCWalkerVisitor >> walkASTCExpressionStatement: anASTCExpressionStatement [
	self walkASTCExpressionStatementExpression:anASTCExpressionStatement.
	
]

{ #category : #walking }
ASTCWalkerVisitor >> walkASTCExpressionStatementExpression:anASTCExpressionStatement [
  ^anASTCExpressionStatement expression acceptVisitor:self.
]

{ #category : #visiting }
ASTCWalkerVisitor >> walkASTCFunctionCall: anASTCFunctionCall [
	self walkASTCFunctionCallId:anASTCFunctionCall.
	self walkASTCFunctionCallArguments:anASTCFunctionCall.
	
]

{ #category : #walking }
ASTCWalkerVisitor >> walkASTCFunctionCallArguments:anASTCFunctionCall [
  ^anASTCFunctionCall arguments do:[:child| child acceptVisitor:self].
]

{ #category : #walking }
ASTCWalkerVisitor >> walkASTCFunctionCallId:anASTCFunctionCall [
  ^anASTCFunctionCall id acceptVisitor:self.
]

{ #category : #visiting }
ASTCWalkerVisitor >> walkASTCFunctionDefinition: anASTCFunctionDefinition [
	self walkASTCFunctionDefinitionDeclarations:anASTCFunctionDefinition.
	self walkASTCFunctionDefinitionId:anASTCFunctionDefinition.
	self walkASTCFunctionDefinitionType:anASTCFunctionDefinition.
	self walkASTCFunctionDefinitionBody:anASTCFunctionDefinition.
	
]

{ #category : #walking }
ASTCWalkerVisitor >> walkASTCFunctionDefinitionBody:anASTCFunctionDefinition [
  ^anASTCFunctionDefinition body acceptVisitor:self.
]

{ #category : #walking }
ASTCWalkerVisitor >> walkASTCFunctionDefinitionDeclarations:anASTCFunctionDefinition [
  ^anASTCFunctionDefinition declarations do:[:child| child acceptVisitor:self].
]

{ #category : #walking }
ASTCWalkerVisitor >> walkASTCFunctionDefinitionId:anASTCFunctionDefinition [
  ^anASTCFunctionDefinition id acceptVisitor:self.
]

{ #category : #walking }
ASTCWalkerVisitor >> walkASTCFunctionDefinitionType:anASTCFunctionDefinition [
  ^anASTCFunctionDefinition type acceptVisitor:self.
]

{ #category : #visiting }
ASTCWalkerVisitor >> walkASTCIdentifier: anASTCIdentifier [
	self walkASTCIdentifierId:anASTCIdentifier.
	
]

{ #category : #walking }
ASTCWalkerVisitor >> walkASTCIdentifierId:anASTCIdentifier [
  
]

{ #category : #visiting }
ASTCWalkerVisitor >> walkASTCIf: anASTCIf [
	self walkASTCIfElse:anASTCIf.
	self walkASTCIfPredicate:anASTCIf.
	self walkASTCIfThen:anASTCIf.
	
]

{ #category : #walking }
ASTCWalkerVisitor >> walkASTCIfElse:anASTCIf [
  ^anASTCIf else acceptVisitor:self.
]

{ #category : #walking }
ASTCWalkerVisitor >> walkASTCIfPredicate:anASTCIf [
  ^anASTCIf predicate acceptVisitor:self.
]

{ #category : #walking }
ASTCWalkerVisitor >> walkASTCIfThen:anASTCIf [
  ^anASTCIf then acceptVisitor:self.
]

{ #category : #visiting }
ASTCWalkerVisitor >> walkASTCLiteral: anASTCLiteral [
	self walkASTCLiteralValue:anASTCLiteral.
	
]

{ #category : #walking }
ASTCWalkerVisitor >> walkASTCLiteralValue:anASTCLiteral [
  
]

{ #category : #visiting }
ASTCWalkerVisitor >> walkASTCNode: anASTCNode [
	self walkASTCNodeParent:anASTCNode.
	
]

{ #category : #walking }
ASTCWalkerVisitor >> walkASTCNodeParent:anASTCNode [
  ^anASTCNode parent acceptVisitor:self.
]

{ #category : #visiting }
ASTCWalkerVisitor >> walkASTCOperator: anASTCOperator [
	self walkASTCOperatorOperands:anASTCOperator.
	self walkASTCOperatorSymbol:anASTCOperator.
	
]

{ #category : #walking }
ASTCWalkerVisitor >> walkASTCOperatorOperands:anASTCOperator [
  ^anASTCOperator operands do:[:child| child acceptVisitor:self].
]

{ #category : #walking }
ASTCWalkerVisitor >> walkASTCOperatorSymbol:anASTCOperator [
  
]

{ #category : #visiting }
ASTCWalkerVisitor >> walkASTCProject: anASTCProject [
	self walkASTCProjectCompilationUnits:anASTCProject.
	
]

{ #category : #walking }
ASTCWalkerVisitor >> walkASTCProjectCompilationUnits:anASTCProject [
  ^anASTCProject compilationUnits do:[:child| child acceptVisitor:self].
]

{ #category : #visiting }
ASTCWalkerVisitor >> walkASTCReturn: anASTCReturn [
	self walkASTCReturnExpression:anASTCReturn.
	
]

{ #category : #walking }
ASTCWalkerVisitor >> walkASTCReturnExpression:anASTCReturn [
  ^anASTCReturn expression acceptVisitor:self.
]

{ #category : #visiting }
ASTCWalkerVisitor >> walkASTCType: anASTCType [
	self walkASTCTypeType:anASTCType.
	
]

{ #category : #walking }
ASTCWalkerVisitor >> walkASTCTypeType:anASTCType [
  
]