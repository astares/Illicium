Class {
	#name : #ASTCGeniePluginTest,
	#superclass : #ASTCSlangTranslationTest,
	#category : #'ASTC-Translation-Tests-plugin'
}

{ #category : #tests }
ASTCGeniePluginTest >> testCSquaredDistanceFromTo [
	| cu |
	self flag: #Unsupported."type annotation to fix"
	
	cu := translator translateMethod: #cSquaredDistanceFrom:to: fromClass: GeniePlugin .
	self assert: cu isStructuralyValidAST.
	^ cu
]

{ #category : #tests }
ASTCGeniePluginTest >> testPrimSameClassAbsoluteStrokeDistanceMyPointsOtherPointsMyVectorsOtherVectorsMySquaredLengthsOtherSquaredLengthsMyAnglesOtherAnglesMaxSizeAndReferenceFlagRowBaseRowInsertRemoveRowInsertRemoveCount [
	| cu |
	self flag: #Unsupported."type annotation to fix"
	
	cu := translator translateMethod: #primSameClassAbsoluteStrokeDistanceMyPoints:otherPoints:myVectors:otherVectors:mySquaredLengths:otherSquaredLengths:myAngles:otherAngles:maxSizeAndReferenceFlag:rowBase:rowInsertRemove:rowInsertRemoveCount: fromClass: GeniePlugin .
	self assert: cu isStructuralyValidAST.
	^ cu
]