Class {
	#name : #FAKernelClass,
	#superclass : #Object,
	#instVars : [
		'receiverNode',
		'methodTranslator'
	],
	#category : #'FAngler-Core-nodes-translators'
}

{ #category : #accessing }
FAKernelClass class >> asASTCType [
	^ ASTCType new type: self asTypeReification ; yourself
]

{ #category : #type }
FAKernelClass class >> asCType [
	self subclassResponsibility 
]

{ #category : #accessing }
FAKernelClass class >> literalNodeFor: aValue [
	^ aValue asLiteralNode 
		propertyAt: FATypeAnnotator property 
		put: (self asPharoType -> 'generated, no PhineasType');
		yourself
	
]

{ #category : #accessing }
FAKernelClass class >> receiverNode: aValue [ 
	^ self new
		receiverNode: aValue;
		yourself
]

{ #category : #'message performing' }
FAKernelClass >> = anotherObject [
	^ self receiverNode = anotherObject receiverNode
]

{ #category : #'message performing' }
FAKernelClass >> declare: aVar typed: aType [
	^ ASTCVariableDeclaration new type: aType; variable: (ASTCIdentifier new id: aVar) ; yourself
]

{ #category : #'message performing' }
FAKernelClass >> ifTranslation: aTranslationBlock ifNot: aNotBlock [
	self flag:#notPretty.
	^ methodTranslator ifNotNil: [ aTranslationBlock value ]
		ifNil:[ aNotBlock value ].
		
	
]

{ #category : #'message performing' }
FAKernelClass >> messageToFunctionCall: aMessage [
	^ ASTCFunctionCall new 
		id: (ASTCIdentifier new id: (FAFormatHelper formatSelector: (aMessage selector)); yourself) ;
		arguments: (aMessage arguments collect:[:each| each acceptVisitor: methodTranslator ]);
		yourself.
		
]

{ #category : #accessing }
FAKernelClass >> myType [
	"in case of most, it doesn't
	for UserTypes, it does."
	^ (receiverNode propertyAt: FATypeAnnotator property) key
]

{ #category : #'message performing' }
FAKernelClass >> perform: aSelector withArguments: anArray [
	" Cherry picking for unknown types are not great. Needs improvement.
	Some stuff get translated by default for UserClasses, which are basically an unknown type."
	^ (self understandsForTranslation: aSelector)
	ifTrue:[ super perform: aSelector withArguments: anArray ] 
	ifFalse:[	 self doesNotUnderstand: ((Message selector: aSelector arguments: anArray) lookupClass: self class ; yourself) ].
	" 
	self browse 
	"
]

{ #category : #printing }
FAKernelClass >> printOn: aStream [
	aStream << self asString.

]

{ #category : #converting }
FAKernelClass >> printString [
	^String streamContents:[:stream|
		stream << (self class asString)
			<<'('
			<< receiverNode printString
			<<')'.
		].
]

{ #category : #evaluating }
FAKernelClass >> receiverNode [
	self flag: #needRenaming."need complete renaming, but too unstable. So just make #= fail for now."
	^ receiverNode
]

{ #category : #evaluating }
FAKernelClass >> receiverNode: aNode [
	receiverNode := aNode
]

{ #category : #evaluating }
FAKernelClass >> translatedReceiver [
	^ self receiverNode acceptVisitor: self visitor
]

{ #category : #'message performing' }
FAKernelClass >> understandsForTranslation: aSelector [
	| class |
	"search the method until ASTCKernelClass, allow partial inheritence"
	class := self class.
	[ 
	(class methodDict includesKey: aSelector) ifTrue: [ ^ true ].
		class := class superclass.
	] doWhileFalse: [ class = FAKernelClass ]."should not be an infinite loop because this class should not be referenced."
	^ false
]

{ #category : #accessing }
FAKernelClass >> visitor [ 
	^methodTranslator
]

{ #category : #accessing }
FAKernelClass >> visitor: aVisitor [
	methodTranslator:= aVisitor.
	^methodTranslator
]