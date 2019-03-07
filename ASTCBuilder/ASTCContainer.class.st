Class {
	#name : #ASTCContainer,
	#superclass : #Object,
	#instVars : [
		'collection',
		'parent'
	],
	#category : #ASTCBuilder
}

{ #category : #initialization }
ASTCContainer >> add:anObject [
	collection add:anObject.
	anObject parent:self.
	^anObject.
]

{ #category : #initialization }
ASTCContainer >> at: index put: anObject [
	self collection at:index put:anObject.	
	anObject parent: self.
	^anObject
]

{ #category : #initialization }
ASTCContainer >> atLastPut:anObject [
	collection atLast:0 put:anObject.
	anObject parent:self.
	^anObject.
]

{ #category : #initialization }
ASTCContainer >> collection [
	^collection
]

{ #category : #initialization }
ASTCContainer >> collection:aCollection [
	collection:=aCollection.
	collection do:[:each | each parent:self.].
	^aCollection.
]

{ #category : #initialization }
ASTCContainer >> doesNotUnderstand: aMessage [
	^aMessage sendTo:collection
]

{ #category : #initialization }
ASTCContainer >> initialize [
	self flag:#modularity.
	
	collection:=LinkedList new.
	parent:=nil.
]

{ #category : #initialization }
ASTCContainer >> parent [
	^parent
]

{ #category : #initialization }
ASTCContainer >> parent:aNode [
	parent:=aNode.
	^parent.
]