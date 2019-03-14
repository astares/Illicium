Class {
	#name : #ASTCOperator,
	#superclass : #ASTCExpression,
	#instVars : [
		'symbol',
		'operands'
	],
	#category : #'ASTC-gen'
}

{ #category : #comparing }
ASTCOperator >> = anotherNode [
	(anotherNode isKindOf: self class)
	ifFalse: [ ^ false ].

	self operands = anotherNode operands
		ifFalse: [ ^ false ].

	^ true
]

{ #category : #visiting }
ASTCOperator >> acceptVisitor: aVisitor [
	aVisitor visitASTCOperator:self.
]

{ #category : #comparing }
ASTCOperator >> hash [
	| hash |
	hash := self identityHash.
	hash := hash + self operands.
	^ hash
]

{ #category : #initialize }
ASTCOperator >> initialize [
	super initialize.
	self initializeOperands.
]

{ #category : #initialize }
ASTCOperator >> initializeOperands [
	operands:=ASTCContainer new parent:self; yourself.
]

{ #category : #testing }
ASTCOperator >> isASTCOperator [
	^true.
]

{ #category : #accessors }
ASTCOperator >> operands [
	^operands
]

{ #category : #accessors }
ASTCOperator >> operands: aCollection [
	operands:=aCollection.
	self operands do:[:each| each parent:self].
			^aCollection.
]

{ #category : #print }
ASTCOperator >> printProperties [
	^String streamContents:[:s |
	s << ' ' << self symbolAsString.].
]

{ #category : #accessors }
ASTCOperator >> symbol [
	^symbol
]

{ #category : #accessors }
ASTCOperator >> symbol: anObject [
	symbol:=anObject.
	^anObject.
]

{ #category : #printing }
ASTCOperator >> symbolAsString [
	^symbol asString.
]