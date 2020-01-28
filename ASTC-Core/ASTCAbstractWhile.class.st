Class {
	#name : #ASTCAbstractWhile,
	#superclass : #ASTCLoop,
	#category : #'ASTC-Core-Nodes'
}

{ #category : #testing }
ASTCAbstractWhile >> = anAbstractWhile [
  super = anAbstractWhile ifFalse: [ ^false ].
  ^true
]

{ #category : #testing }
ASTCAbstractWhile >> acceptVisitor: aVisitor [
  aVisitor visitAbstractWhile: self
]

{ #category : #testing }
ASTCAbstractWhile >> isAbstractWhile [
  ^true
]