Class {
	#name : #ILIlliciumGeneratorForTest,
	#superclass : #Object,
	#category : #'IlliciumPlugins-Tests'
}

{ #category : #'as yet unclassified' }
ILIlliciumGeneratorForTest >> generateCodeForSelector: selector inClass: aClass [

	| cu |
	cu := ASTCClassTranslator new
		mainTranslator: ASTCTranslator new;
	 compilationUnitForClass: aClass.
	1halt.
]