Class {
	#name : #ASTCFunctionCall,
	#superclass : #ASTCExpression,
	#instVars : [
		'id',
		'arguments'
	],
	#category : #'ASTC-Gen'
}

{ #category : #comparing }
ASTCFunctionCall >> = anotherNode [
	(anotherNode class = self class)
	ifFalse: [ ^ false ].

	self arguments = anotherNode arguments
		ifFalse: [ ^ false ].

	^ true
]

{ #category : #visiting }
ASTCFunctionCall >> acceptVisitor: aVisitor [
	aVisitor visitASTCFunctionCall:self.
]

{ #category : #accessors }
ASTCFunctionCall >> arguments [
	^arguments
]

{ #category : #accessors }
ASTCFunctionCall >> arguments: aCollection [
	arguments:=aCollection.
	self arguments do:[:each| each parent:self].
			^aCollection.
]

{ #category : #comparing }
ASTCFunctionCall >> hash [
	| hash |
	hash := self identityHash.
	hash := hash + self arguments.
	^ hash
]

{ #category : #accessors }
ASTCFunctionCall >> id [
	^id
]

{ #category : #accessors }
ASTCFunctionCall >> id: anObject [
	id:=anObject.
	anObject parent:self.
	^anObject.
]

{ #category : #initialize }
ASTCFunctionCall >> initialize [
	super initialize.
	self initializeArguments.
]

{ #category : #initialize }
ASTCFunctionCall >> initializeArguments [
	arguments:=ASTCContainer new parent:self; yourself.
]

{ #category : #testing }
ASTCFunctionCall >> isASTCFunctionCall [
	^true.
]

{ #category : #print }
ASTCFunctionCall >> printProperties [
	^''
]