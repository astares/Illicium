Class {
	#name : #IlliciumArray,
	#superclass : #IlliciumObject,
	#instVars : [
		'elementType'
	],
	#category : #'MAngler-Illicium-messages-translators'
}

{ #category : #type }
IlliciumArray class >> asCType [
	" Array don't know what type they are because it's a complex one. 
	It relies on CollectionType, which will build the corresponding CType"
	^ self shouldNotImplement 
]

{ #category : #accessing }
IlliciumArray >> at: anIndex [
	"(methodTranslator getNodeTranslationType: anIndex = ASTCSmallInteger) ifFalse:[ self error: 'Only SmallInteger should be used as array index for now']."
	 self flag:#todo.
	^ self translatedReceiver indexAt:(anIndex acceptVisitor: methodTranslator)
]

{ #category : #accessing }
IlliciumArray >> at: anIndex put: aValue [
	"(methodTranslator getNodeTranslationType: anIndex = ASTCSmallInteger) ifFalse:[ self error: 'Only SmallInteger should be used as array index for now']."
	^ (self at: anIndex) assign: (aValue acceptVisitor: methodTranslator)
]

{ #category : #accessing }
IlliciumArray >> do: aBlock [
	| size newBlock res arg iterator receiver |
	aBlock isBlock ifFalse:[ BadArgument new expected: RBBlockNode; result: aBlock class; signal ].
	aBlock arguments size = 1 ifFalse:[ ArgumentsCountMismatch signal ].
	
	size := [(receiverNode propertyAt: #type) key size] on: NotFound 
		do:[ self error: '#do: is curently only usable if the IV using it defines a size property' ].
	newBlock := aBlock copy.
	newBlock arguments at: 1 put: ((RBArgumentNode named: #i) parent: newBlock).
	res := methodTranslator forward: 
			(MessageSend receiver: (IlliciumSmallInteger literalNodeFor: 0) 
				selector: #to:do: 
				arguments:{ IlliciumSmallInteger literalNodeFor: size. newBlock} )
		to: SmallInteger.
		
	arg := (aBlock arguments at: 1) acceptVisitor: methodTranslator.
	iterator := (newBlock arguments at: 1) acceptVisitor: methodTranslator.
	receiver := self translatedReceiver.
	
	res body statements addFirst:
		(ASTCIf new condition: (arg equals: (ASTCLiteral value: #null));
			then: ASTCBreak new;
			yourself).
	
	res body statements addFirst: 
		(arg assign: (receiver indexAt: iterator))
		asStatement.
		
	^ res
]

{ #category : #accessing }
IlliciumArray >> elementType [
	^ elementType
]

{ #category : #accessing }
IlliciumArray >> elementType: aType [
	elementType := aType
]