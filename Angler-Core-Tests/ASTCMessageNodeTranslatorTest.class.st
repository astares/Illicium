Class {
	#name : #ASTCMessageNodeTranslatorTest,
	#superclass : #ASTCNodeTranslatorTest,
	#category : #'Angler-Core-Tests-Translators'
}

{ #category : #accessing }
ASTCMessageNodeTranslatorTest class >> testedClass [
	^ self subclassResponsibility
]

{ #category : #tests }
ASTCMessageNodeTranslatorTest >> testASTCEqual [
	| astC expectedC|
	astC := (ASTCTranslator translateExpression: '1 = 6') statements at: 1.
	
	expectedC := ASTCEqualityOperator new
		addOperand: (ASTCLiteral value: 1);
		addOperand: (ASTCLiteral value: 6);
		yourself.
	
	self assert: astC isExpressionStatement.
	self assert: astC expression isOperator.
	self assert: astC expression operands first value equals: 1.
	self assert: astC expression operands second value equals: 6.
	self assert: astC expression equals: expectedC.
]