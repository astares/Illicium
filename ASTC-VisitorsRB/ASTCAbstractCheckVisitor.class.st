Class {
	#name : #ASTCAbstractCheckVisitor,
	#superclass : #RBProgramNodeVisitor,
	#category : #'ASTC-VisitorsRB'
}

{ #category : #accessing }
ASTCAbstractCheckVisitor class >> property [
	"should return a symbol with the name of the property"
	^SubclassResponsibility  
]

{ #category : #accessing }
ASTCAbstractCheckVisitor >> atNewProperty: aProperty put: aValue for:anArgumentNode [
	"similar to #at:put:, but check that this didn't exists previously"

	(anArgumentNode propertyAt: aProperty
		ifPresent:[:assoc|
			 "self error:
				(String streamContents:[:s| s << ' visitor property conflict. ''' << aProperty << ''' already exists for instance of ' << anArgumentNode class name])"]
		ifAbsent: [ anArgumentNode propertyAt: aProperty put: aValue. ] ).
		
	^aValue
]

{ #category : #accessing }
ASTCAbstractCheckVisitor >> atNewPropertyPut: aValue for:anArgumentNode [
	"shortcut"
	^self atNewProperty: self class property put: aValue for: anArgumentNode 
]