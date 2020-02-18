"
I am an abstract test class for RB Types annotators classes.
I define basic tests for them.
"
Class {
	#name : #FATypeAnnotatorTest,
	#superclass : #ASTCVisitorTest,
	#instVars : [
		'iv'
	],
	#classVars : [
		'A'
	],
	#category : #'FAngler-RB-Visitors-Tests-typing'
}

{ #category : #testing }
FATypeAnnotatorTest class >> isAbstract [
	^ true
]

{ #category : #support }
FATypeAnnotatorTest >> aBlockWithIntegerAsLastStatement [
	[ 4 ]
]

{ #category : #support }
FATypeAnnotatorTest >> aMethodThatReturnAMessageThatReturnsAnInt [
	^ 1 + 2
]

{ #category : #support }
FATypeAnnotatorTest >> aMethodThatReturnsAnInteger [
	^ 4
]

{ #category : #support }
FATypeAnnotatorTest >> aMethodWithABlockWithATemporary [
	^ [ | i | i := 3 ] value
]

{ #category : #support }
FATypeAnnotatorTest >> aMethodWithABlockWithAnArgument [
	^ [:i| ] value: 1
]

{ #category : #support }
FATypeAnnotatorTest >> aMethodWithACascade [
	1 + 2 ; - 3 
]

{ #category : #support }
FATypeAnnotatorTest >> aMethodWithAClassVariable [
	A := 3
]

{ #category : #support }
FATypeAnnotatorTest >> aMethodWithAGlobalVariable [
	FATypeAnnotatorTest
]

{ #category : #support }
FATypeAnnotatorTest >> aMethodWithALiteralNode [
	1
]

{ #category : #support }
FATypeAnnotatorTest >> aMethodWithATemporaryVariable [
	| t |
	t := 3
]

{ #category : #support }
FATypeAnnotatorTest >> aMethodWithAnArgument: anInt [
	^ anInt
]

{ #category : #support }
FATypeAnnotatorTest >> aMethodWithAnAssignement [
	| e |
	e := 3 
]

{ #category : #support }
FATypeAnnotatorTest >> aMethodWithAnInstanceVariable [
	iv := 3
]

{ #category : #support }
FATypeAnnotatorTest >> aMethodWithSelf [
	self
]

{ #category : #test }
FATypeAnnotatorTest >> inferMethodSelector: aSelector from: aClass [
	^ self subclassResponsibility
]

{ #category : #running }
FATypeAnnotatorTest >> setUp [
	"visitor must be set before sending super setUp in subclasses."
	super setUp.
	propertyName := visitor class property
]

{ #category : #test }
FATypeAnnotatorTest >> testVisitArgumentNode [
	| ast counter |
	counter := 0.
	ast := self inferMethodSelector: #aMethodWithAnArgument: from: FATypeAnnotatorTest.
	ast nodesDo: [ :aNode | 
		aNode isArgument
			ifTrue: [ 
				counter := counter + 1.
				self assert: (aNode hasProperty: propertyName).
			] ].
	self assert: counter equals: 2.
]

{ #category : #test }
FATypeAnnotatorTest >> testVisitAssignmentNode [
	| counter ast |
	counter := 0.
	ast := self inferMethodSelector: #aMethodWithAnAssignement from: FATypeAnnotatorTest.
	ast nodesDo: [ :aNode | 
		aNode isAssignment
			ifTrue: [ 
				counter := counter + 1.
				self assert: (aNode hasProperty: propertyName).
			] ].
	self assert: counter equals: 1.
]

{ #category : #test }
FATypeAnnotatorTest >> testVisitBlockNode [
	| counter ast |
	counter := 0.
	ast := self inferMethodSelector: #aBlockWithIntegerAsLastStatement from: FATypeAnnotatorTest.
	ast nodesDo: [ :aNode | 
		aNode isBlock
			ifTrue: [ 
				counter := counter + 1.
				self assert: (aNode hasProperty: propertyName).
			] ].
	self assert: counter equals: 1.
]

{ #category : #test }
FATypeAnnotatorTest >> testVisitCascadeNodeGlobal [
	| ast counterValueNode counterMessageNode |
	counterValueNode := 0.
	counterMessageNode := 0.
	
	ast := self inferMethodSelector: #aMethodWithACascade from: FATypeAnnotatorTest.
	
	ast nodesDo: [ :aNode | 
		aNode isLiteralNode
			ifTrue: [ 
				counterValueNode := counterValueNode + 1.
				self assert: (aNode hasProperty: propertyName).
			].
		aNode isMessage 
			ifTrue:[
				counterMessageNode := counterMessageNode + 1.
				self assert: (aNode hasProperty: propertyName).
				]].
		
	self assert: counterValueNode equals: 4. "We visit the receiver twice, and both of them must be typed"
	self assert: counterMessageNode equals: 2.
	
]

{ #category : #test }
FATypeAnnotatorTest >> testVisitGlobalNodeClassVariable [
	| ast counter |
	counter := 0.
	ast := self inferMethodSelector: #aMethodWithAClassVariable from: FATypeAnnotatorTest.
	ast nodesDo: [ :aNode | 
		aNode isGlobalNode
			ifTrue: [ 
				counter := counter + 1.
				self assert: (aNode hasProperty: propertyName) 
			] ].
	self assert: counter equals: 1
]

{ #category : #test }
FATypeAnnotatorTest >> testVisitGlobalNodeGlobal [
	| ast counter |
	counter := 0.
	ast := self inferMethodSelector: #aMethodWithAGlobalVariable from: FATypeAnnotatorTest.
	ast nodesDo: [ :aNode | 
		aNode isGlobalNode
			ifTrue: [ 
				counter := counter + 1.
				self assert: (aNode hasProperty: propertyName).
			] ].
	self assert: counter equals: 1
	
]

{ #category : #test }
FATypeAnnotatorTest >> testVisitGlobalNodeSharedPoolVariable [
	| ast counter |
	<expectedFailure>
	self flag:#todo."waiting to have a better understanding"
	self assert:false.
	
]

{ #category : #test }
FATypeAnnotatorTest >> testVisitInstanceVariableNode [
	| ast counter |
	counter := 0.
	ast := self inferMethodSelector: #aMethodWithAnInstanceVariable from: FATypeAnnotatorTest.
	ast
		nodesDo: [ :aNode | 
			aNode isInstanceVariableNode
				ifTrue: [ counter := counter + 1.
					self assert: (aNode hasProperty: propertyName) 
				] ].
	self assert: counter equals: 1
]

{ #category : #test }
FATypeAnnotatorTest >> testVisitLiteralNode [
	| ast counter |
	counter := 0.
	ast := self inferMethodSelector: #aMethodWithALiteralNode from: FATypeAnnotatorTest.
	ast
		nodesDo: [ :aNode | 
			(aNode isLiteralNode and: [ aNode isValue ])
				ifTrue: [ counter := counter + 1.
					self assert: (aNode hasProperty: propertyName) 
				] ].
	self assert: counter equals: 1
]

{ #category : #test }
FATypeAnnotatorTest >> testVisitMessageNode [
	| ast counter |
	counter := 0.
	ast := self inferMethodSelector: #aMethodThatReturnAMessageThatReturnsAnInt from: FATypeAnnotatorTest.
	ast
		nodesDo: [ :aNode | 
			aNode isMessage
				ifTrue: [ counter := counter + 1.
					self assert: (aNode hasProperty: propertyName) 
				] ].
	self assert: counter equals: 1
]

{ #category : #test }
FATypeAnnotatorTest >> testVisitMethodNode [
	| ast counter |
	counter := 0.
	ast := self inferMethodSelector: #aMethodThatReturnsAnInteger from: FATypeAnnotatorTest.
	ast
		nodesDo: [ :aNode | 
			aNode isMethod
				ifTrue: [ counter := counter + 1.
					self assert: (aNode hasProperty: propertyName) 
				] ].
	self assert: counter equals: 1
]

{ #category : #test }
FATypeAnnotatorTest >> testVisitSelfNode [
	| ast counter |
	counter := 0.
	ast := self inferMethodSelector: #aMethodWithSelf from: FATypeAnnotatorTest.
	ast
		nodesDo: [ :aNode | 
			aNode isSelf
				ifTrue: [ counter := counter + 1.
					self assert: (aNode hasProperty: propertyName) 
				] ].
	self assert: counter equals: 1
]

{ #category : #test }
FATypeAnnotatorTest >> testVisitTemporaryNode [
	| ast counter |
	counter := 0.
	ast := self inferMethodSelector: #aMethodWithATemporaryVariable from: FATypeAnnotatorTest.
	ast
		nodesDo: [ :aNode | 
			(aNode isSelf not and: [ aNode isTemporaryNode ])
				ifTrue: [ counter := counter + 1.
					self assert: (aNode hasProperty: propertyName) 
				] ].
	self assert: counter equals: 2
]