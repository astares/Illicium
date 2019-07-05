Class {
	#name : #ASTCClassTranslator,
	#superclass : #Object,
	#category : #'ASTC-Translation'
}

{ #category : #'as yet unclassified' }
ASTCClassTranslator class >> translateClass: aClass [
	^self new translateClass: aClass
]

{ #category : #'as yet unclassified' }
ASTCClassTranslator >> translateClass: aClass [
	| primitives inferer typeAnnotator translator cu printer |
	(aClass traitComposition
		includesTrait: ASTCVirtualMachineAPI)
		ifFalse: [ self error: 'can only translate plugins for now.' ].

	cu:=ASTCCompilationUnit new.
	primitives := aClass methods
		select: [ :aMethod | 
			aMethod pragmas
				anySatisfy: [ :aPragma | aPragma selector = ASTCVirtualMachineAPI primitiveName ] ]
		thenCollect:[ :aMethod | aMethod ast copy].

	inferer := PhineasInferer new.
	inferer inferAST: (aClass >> #initializePlugin) ast copy.
	primitives do:[:aMethodAST|
		inferer inferAST: aMethodAST ].

	typeAnnotator := ASTCTypeAnnotationAST new inferer: inferer ;yourself.
	primitives do:[:aMethodAST|
		aMethodAST acceptVisitor: typeAnnotator
		].

	translator := ASTCFromPharo new.
	primitives do:[:aMethodAST| |res|
		res:=translator visitMethodAST: aMethodAST.
		cu definitions add: res.
		cu declarations add: res declaration.
		]. 
	
	self flag:#horiffic."anyone here. Should use the mainTranslator"
	
	aClass allInstVarNames do:[:ivName| |ivType|
		ivType:=translator typeDictionnary at: (typeAnnotator getTypeOfInstanceVariable: ivName ofClass: aClass) anyOne.
		cu declarations	add: 
			(ASTCVariableDeclaration new
				id: (ASTCIdentifier new id: ivName ; yourself);
				type: (ASTCType new type: ivType ; yourself);
				yourself).
		].
	
	cu debugASTCStructure.
	
	printer := ASTCFilePrinter new
		fileName: 'aFile' ;
		compilationUnit: cu ;
		isPrimitive: true;
		yourself.
	
	printer printInFile.
	
	printer CompileExternalPlugin.
	printer moveInVmDirectory.
	
	
	self halt.
]