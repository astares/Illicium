Class {
	#name : #ASTCNode,
	#superclass : #Object,
	#instVars : [
		'pharoNode',
		'comment',
		'parent'
	],
	#category : #'ASTC-Core-Nodes'
}

{ #category : #testing }
ASTCNode >> acceptVisitor: aVisitor [
  aVisitor visitNode: self
]

{ #category : #accessing }
ASTCNode >> comment [
  ^comment
]

{ #category : #accessing }
ASTCNode >> comment: aComment [
  comment := aComment
]

{ #category : #testing }
ASTCNode >> isAbstractWhile [
  ^false
]

{ #category : #testing }
ASTCNode >> isAdditionOperator [
  ^false
]

{ #category : #testing }
ASTCNode >> isAddressOfOperator [
  ^false
]

{ #category : #testing }
ASTCNode >> isAndOperator [
  ^false
]

{ #category : #testing }
ASTCNode >> isAssignementAdditionOperator [
  ^false
]

{ #category : #testing }
ASTCNode >> isAssignmentOperator [
  ^false
]

{ #category : #testing }
ASTCNode >> isBinaryOperator [
  ^false
]

{ #category : #testing }
ASTCNode >> isBitLeftShiftOperator [
  ^false
]

{ #category : #testing }
ASTCNode >> isBitRightShiftOperator [
  ^false
]

{ #category : #testing }
ASTCNode >> isBitwiseAndOperator [
  ^false
]

{ #category : #testing }
ASTCNode >> isBitwiseOrOperator [
  ^false
]

{ #category : #testing }
ASTCNode >> isBitwiseXorOperator [
  ^false
]

{ #category : #testing }
ASTCNode >> isBlock [
  ^false
]

{ #category : #testing }
ASTCNode >> isBreak [
  ^false
]

{ #category : #testing }
ASTCNode >> isCastOperator [
  ^false
]

{ #category : #testing }
ASTCNode >> isCompilationUnit [
  ^false
]

{ #category : #testing }
ASTCNode >> isDeclaration [
  ^false
]

{ #category : #testing }
ASTCNode >> isDeclarationStatement [
  ^false
]

{ #category : #testing }
ASTCNode >> isDefinition [
  ^false
]

{ #category : #testing }
ASTCNode >> isDivisionOperator [
  ^false
]

{ #category : #testing }
ASTCNode >> isDoWhile [
  ^false
]

{ #category : #testing }
ASTCNode >> isEmptyStatement [
  ^false
]

{ #category : #testing }
ASTCNode >> isEqualityOperator [
  ^false
]

{ #category : #testing }
ASTCNode >> isExpression [
  ^false
]

{ #category : #testing }
ASTCNode >> isExpressionStatement [
  ^false
]

{ #category : #testing }
ASTCNode >> isFor [
  ^false
]

{ #category : #testing }
ASTCNode >> isFunctionCall [
  ^false
]

{ #category : #testing }
ASTCNode >> isFunctionDeclaration [
  ^false
]

{ #category : #testing }
ASTCNode >> isFunctionDefinition [
  ^false
]

{ #category : #testing }
ASTCNode >> isGreaterOperator [
  ^false
]

{ #category : #testing }
ASTCNode >> isGreaterOrEqualOperator [
  ^false
]

{ #category : #testing }
ASTCNode >> isIdentifier [
  ^false
]

{ #category : #testing }
ASTCNode >> isIf [
  ^false
]

{ #category : #testing }
ASTCNode >> isIndexerOperator [
  ^false
]

{ #category : #testing }
ASTCNode >> isInequalityOperator [
  ^false
]

{ #category : #testing }
ASTCNode >> isLesserOperator [
  ^false
]

{ #category : #testing }
ASTCNode >> isLesserOrEqualOperator [
  ^false
]

{ #category : #testing }
ASTCNode >> isLiteral [
  ^false
]

{ #category : #testing }
ASTCNode >> isLogicalNotOperator [
  ^false
]

{ #category : #testing }
ASTCNode >> isLoop [
  ^false
]

{ #category : #testing }
ASTCNode >> isModuloOperator [
  ^false
]

{ #category : #testing }
ASTCNode >> isMultiplicationOperator [
  ^false
]

{ #category : #testing }
ASTCNode >> isNegationOperator [
  ^false
]

{ #category : #testing }
ASTCNode >> isNode [
  ^true
]

{ #category : #testing }
ASTCNode >> isOperator [
  ^false
]

{ #category : #testing }
ASTCNode >> isOrOperator [
  ^false
]

{ #category : #testing }
ASTCNode >> isPreDecrementOperator [
  ^false
]

{ #category : #testing }
ASTCNode >> isPreIncrementOperator [
  ^false
]

{ #category : #testing }
ASTCNode >> isPreprocessorIf [
  ^false
]

{ #category : #testing }
ASTCNode >> isProject [
  ^false
]

{ #category : #testing }
ASTCNode >> isRawCCode [
  ^false
]

{ #category : #testing }
ASTCNode >> isRawDeclaration [
  ^false
]

{ #category : #testing }
ASTCNode >> isReturn [
  ^false
]

{ #category : #testing }
ASTCNode >> isStatement [
  ^false
]

{ #category : #testing }
ASTCNode >> isStructAccessPointerOperator [
  ^false
]

{ #category : #testing }
ASTCNode >> isStructAccessStaticOperator [
  ^false
]

{ #category : #testing }
ASTCNode >> isStructureDeclaration [
  ^false
]

{ #category : #testing }
ASTCNode >> isStructureDefinition [
  ^false
]

{ #category : #testing }
ASTCNode >> isSubtractionOperator [
  ^false
]

{ #category : #testing }
ASTCNode >> isTernaryConditionalOperator [
  ^false
]

{ #category : #testing }
ASTCNode >> isType [
  ^false
]

{ #category : #testing }
ASTCNode >> isUnaryOperator [
  ^false
]

{ #category : #testing }
ASTCNode >> isVariableDeclaration [
  ^false
]

{ #category : #testing }
ASTCNode >> isVariableDefinition [
  ^false
]

{ #category : #testing }
ASTCNode >> isWhile [
  ^false
]

{ #category : #accessing }
ASTCNode >> parent [
  ^parent
]

{ #category : #accessing }
ASTCNode >> pharoNode [
  ^pharoNode
]

{ #category : #accessing }
ASTCNode >> pharoNode: aPharoNode [
  pharoNode := aPharoNode
]