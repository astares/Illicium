Class {
	#name : #ASTCSuperclassVisitor,
	#superclass : #ASTCVisitor,
	#category : #'ASTC-Core-visitors'
}

{ #category : #visiting }
ASTCSuperclassVisitor >> visitAbstractWhile: anAbstractWhile [
  ^self visitLoop: anAbstractWhile
]

{ #category : #visiting }
ASTCSuperclassVisitor >> visitAdditionOperator: anAdditionOperator [
  ^self visitBinaryOperator: anAdditionOperator
]

{ #category : #visiting }
ASTCSuperclassVisitor >> visitAddressOfOperator: anAddressOfOperator [
  ^self visitUnaryOperator: anAddressOfOperator
]

{ #category : #visiting }
ASTCSuperclassVisitor >> visitAndOperator: anAndOperator [
  ^self visitBinaryOperator: anAndOperator
]

{ #category : #visiting }
ASTCSuperclassVisitor >> visitAssignementAdditionOperator: anAssignementAdditionOperator [
  ^self visitBinaryOperator: anAssignementAdditionOperator
]

{ #category : #visiting }
ASTCSuperclassVisitor >> visitAssignmentOperator: anAssignmentOperator [
  ^self visitBinaryOperator: anAssignmentOperator
]

{ #category : #visiting }
ASTCSuperclassVisitor >> visitBinaryOperator: aBinaryOperator [
  ^self visitOperator: aBinaryOperator
]

{ #category : #visiting }
ASTCSuperclassVisitor >> visitBitLeftShiftOperator: aBitLeftShiftOperator [
  ^self visitBinaryOperator: aBitLeftShiftOperator
]

{ #category : #visiting }
ASTCSuperclassVisitor >> visitBitRightShiftOperator: aBitRightShiftOperator [
  ^self visitBinaryOperator: aBitRightShiftOperator
]

{ #category : #visiting }
ASTCSuperclassVisitor >> visitBitwiseAndOperator: aBitwiseAndOperator [
  ^self visitBinaryOperator: aBitwiseAndOperator
]

{ #category : #visiting }
ASTCSuperclassVisitor >> visitBitwiseOrOperator: aBitwiseOrOperator [
  ^self visitBinaryOperator: aBitwiseOrOperator
]

{ #category : #visiting }
ASTCSuperclassVisitor >> visitBitwiseXorOperator: aBitwiseXorOperator [
  ^self visitBinaryOperator: aBitwiseXorOperator
]

{ #category : #visiting }
ASTCSuperclassVisitor >> visitBlock: aBlock [
  ^self visitStatement: aBlock
]

{ #category : #visiting }
ASTCSuperclassVisitor >> visitBreak: aBreak [
  ^self visitStatement: aBreak
]

{ #category : #visiting }
ASTCSuperclassVisitor >> visitCastOperator: aCastOperator [
  ^self visitUnaryOperator: aCastOperator
]

{ #category : #visiting }
ASTCSuperclassVisitor >> visitCompilationUnit: aCompilationUnit [
  ^self visitNode: aCompilationUnit
]

{ #category : #visiting }
ASTCSuperclassVisitor >> visitDeclaration: aDeclaration [
  ^self visitNode: aDeclaration
]

{ #category : #visiting }
ASTCSuperclassVisitor >> visitDeclarationStatement: aDeclarationStatement [
  ^self visitStatement: aDeclarationStatement
]

{ #category : #visiting }
ASTCSuperclassVisitor >> visitDefinition: aDefinition [
  ^self visitNode: aDefinition
]

{ #category : #visiting }
ASTCSuperclassVisitor >> visitDivisionOperator: aDivisionOperator [
  ^self visitBinaryOperator: aDivisionOperator
]

{ #category : #visiting }
ASTCSuperclassVisitor >> visitDoWhile: aDoWhile [
  ^self visitAbstractWhile: aDoWhile
]

{ #category : #visiting }
ASTCSuperclassVisitor >> visitEmptyStatement: anEmptyStatement [
  ^self visitStatement: anEmptyStatement
]

{ #category : #visiting }
ASTCSuperclassVisitor >> visitEqualityOperator: anEqualityOperator [
  ^self visitBinaryOperator: anEqualityOperator
]

{ #category : #visiting }
ASTCSuperclassVisitor >> visitExpression: anExpression [
  ^self visitNode: anExpression
]

{ #category : #visiting }
ASTCSuperclassVisitor >> visitExpressionStatement: anExpressionStatement [
  ^self visitStatement: anExpressionStatement
]

{ #category : #visiting }
ASTCSuperclassVisitor >> visitFor: aFor [
  ^self visitLoop: aFor
]

{ #category : #visiting }
ASTCSuperclassVisitor >> visitFunctionCall: aFunctionCall [
  ^self visitExpression: aFunctionCall
]

{ #category : #visiting }
ASTCSuperclassVisitor >> visitFunctionDeclaration: aFunctionDeclaration [
  ^self visitDeclaration: aFunctionDeclaration
]

{ #category : #visiting }
ASTCSuperclassVisitor >> visitFunctionDefinition: aFunctionDefinition [
  ^self visitDefinition: aFunctionDefinition
]

{ #category : #visiting }
ASTCSuperclassVisitor >> visitGreaterOperator: aGreaterOperator [
  ^self visitBinaryOperator: aGreaterOperator
]

{ #category : #visiting }
ASTCSuperclassVisitor >> visitGreaterOrEqualOperator: aGreaterOrEqualOperator [
  ^self visitBinaryOperator: aGreaterOrEqualOperator
]

{ #category : #visiting }
ASTCSuperclassVisitor >> visitIdentifier: anIdentifier [
  ^self visitExpression: anIdentifier
]

{ #category : #visiting }
ASTCSuperclassVisitor >> visitIf: anIf [
  ^self visitStatement: anIf
]

{ #category : #visiting }
ASTCSuperclassVisitor >> visitIndexerOperator: anIndexerOperator [
  ^self visitBinaryOperator: anIndexerOperator
]

{ #category : #visiting }
ASTCSuperclassVisitor >> visitInequalityOperator: anInequalityOperator [
  ^self visitBinaryOperator: anInequalityOperator
]

{ #category : #visiting }
ASTCSuperclassVisitor >> visitLesserOperator: aLesserOperator [
  ^self visitBinaryOperator: aLesserOperator
]

{ #category : #visiting }
ASTCSuperclassVisitor >> visitLesserOrEqualOperator: aLesserOrEqualOperator [
  ^self visitBinaryOperator: aLesserOrEqualOperator
]

{ #category : #visiting }
ASTCSuperclassVisitor >> visitLiteral: aLiteral [
  ^self visitExpression: aLiteral
]

{ #category : #visiting }
ASTCSuperclassVisitor >> visitLogicalNotOperator: aLogicalNotOperator [
  ^self visitUnaryOperator: aLogicalNotOperator
]

{ #category : #visiting }
ASTCSuperclassVisitor >> visitLoop: aLoop [
  ^self visitStatement: aLoop
]

{ #category : #visiting }
ASTCSuperclassVisitor >> visitModuloOperator: aModuloOperator [
  ^self visitBinaryOperator: aModuloOperator
]

{ #category : #visiting }
ASTCSuperclassVisitor >> visitMultiplicationOperator: aMultiplicationOperator [
  ^self visitBinaryOperator: aMultiplicationOperator
]

{ #category : #visiting }
ASTCSuperclassVisitor >> visitNegationOperator: aNegationOperator [
  ^self visitUnaryOperator: aNegationOperator
]

{ #category : #visiting }
ASTCSuperclassVisitor >> visitOperator: anOperator [
  ^self visitExpression: anOperator
]

{ #category : #visiting }
ASTCSuperclassVisitor >> visitOrOperator: anOrOperator [
  ^self visitBinaryOperator: anOrOperator
]

{ #category : #visiting }
ASTCSuperclassVisitor >> visitPreDecrementOperator: aPreDecrementOperator [
  ^self visitUnaryOperator: aPreDecrementOperator
]

{ #category : #visiting }
ASTCSuperclassVisitor >> visitPreIncrementOperator: aPreIncrementOperator [
  ^self visitUnaryOperator: aPreIncrementOperator
]

{ #category : #visiting }
ASTCSuperclassVisitor >> visitPreprocessorIf: aPreprocessorIf [
  ^self visitExpression: aPreprocessorIf
]

{ #category : #visiting }
ASTCSuperclassVisitor >> visitProject: aProject [
  ^self visitNode: aProject
]

{ #category : #visiting }
ASTCSuperclassVisitor >> visitRawCCode: aRawCCode [
  ^self visitExpression: aRawCCode
]

{ #category : #visiting }
ASTCSuperclassVisitor >> visitRawDeclaration: aRawDeclaration [
  ^self visitDeclarationStatement: aRawDeclaration
]

{ #category : #visiting }
ASTCSuperclassVisitor >> visitReturn: aReturn [
  ^self visitStatement: aReturn
]

{ #category : #visiting }
ASTCSuperclassVisitor >> visitStatement: aStatement [
  ^self visitNode: aStatement
]

{ #category : #visiting }
ASTCSuperclassVisitor >> visitStructAccessPointerOperator: aStructAccessPointerOperator [
  ^self visitBinaryOperator: aStructAccessPointerOperator
]

{ #category : #visiting }
ASTCSuperclassVisitor >> visitStructAccessStaticOperator: aStructAccessStaticOperator [
  ^self visitBinaryOperator: aStructAccessStaticOperator
]

{ #category : #visiting }
ASTCSuperclassVisitor >> visitStructureDeclaration: aStructureDeclaration [
  ^self visitDeclaration: aStructureDeclaration
]

{ #category : #visiting }
ASTCSuperclassVisitor >> visitStructureDefinition: aStructureDefinition [
  ^self visitDefinition: aStructureDefinition
]

{ #category : #visiting }
ASTCSuperclassVisitor >> visitSubtractionOperator: aSubtractionOperator [
  ^self visitBinaryOperator: aSubtractionOperator
]

{ #category : #visiting }
ASTCSuperclassVisitor >> visitTernaryConditionalOperator: aTernaryConditionalOperator [
  ^self visitOperator: aTernaryConditionalOperator
]

{ #category : #visiting }
ASTCSuperclassVisitor >> visitType: aType [
  ^self visitNode: aType
]

{ #category : #visiting }
ASTCSuperclassVisitor >> visitUnaryOperator: anUnaryOperator [
  ^self visitOperator: anUnaryOperator
]

{ #category : #visiting }
ASTCSuperclassVisitor >> visitVariableDeclaration: aVariableDeclaration [
  ^self visitDeclaration: aVariableDeclaration
]

{ #category : #visiting }
ASTCSuperclassVisitor >> visitVariableDefinition: aVariableDefinition [
  ^self visitDefinition: aVariableDefinition
]

{ #category : #visiting }
ASTCSuperclassVisitor >> visitWhile: aWhile [
  ^self visitAbstractWhile: aWhile
]