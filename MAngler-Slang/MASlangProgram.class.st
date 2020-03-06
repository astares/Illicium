Class {
	#name : #MASlangProgram,
	#superclass : #FAProgram,
	#category : #'MAngler-Slang-Translation'
}

{ #category : #accessing }
MASlangProgram >> classes [

	^ { VMClass. SpurMemoryManager . Spur64BitMemoryManager . StackInterpreter }
]

{ #category : #accessing }
MASlangProgram >> prepareWithInferer: inferer inTranslator: aTranslator [

	self isFullyAnnotated ifTrue: [ ^ self ].
	
	inferer vmClass: self vmClass.
	self classesDo: [ :each | 
		each prepareToBeAddedToCodeGenerator: inferer.
		inferer checkClassForNameConflicts: each.
		inferer addClassVarsFor: each.
		inferer addPoolVarsFor: each.
		(each inheritsFrom: VMStructType) ifFalse:
			[inferer globalsAsSet addAll: (inferer instVarNamesForClass: each)].
		inferer retainMethods: (each requiredMethodNames: inferer options).
		 each methods
			select: [ :aMethod | aTranslator shouldITranslate: aMethod ]
			thenDo: [ :method |
			| copy |
			copy := method ast copy.
			self addMethod: copy.
			inferer addMethod: (copy asTranslationMethodOfClass: TMethod) ].
		each declareCVarsIn: inferer ].
	"self program methodsDo: [ :each | inferer addMethod: (each asTranslationMethodOfClass: TMethod)]."
	inferer inferTypesForImplicitlyTypedVariablesAndMethods.
	aTranslator prepareMethodsASTs: (self methods "select: [:e| e methodClass ~~ StackInterpreter]").
	self isFullyAnnotated: true
]

{ #category : #accessing }
MASlangProgram >> vmClass [
	
	^ StackInterpreter
]

{ #category : #accessing }
MASlangProgram >> wordSize [
	
	^ 8 "64bits for now"
]