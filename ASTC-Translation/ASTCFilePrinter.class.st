Class {
	#name : #ASTCFilePrinter,
	#superclass : #Object,
	#instVars : [
		'fileName',
		'classDictionary',
		'isPrimitive',
		'virtualMachine'
	],
	#category : #'ASTC-Translation'
}

{ #category : #printing }
ASTCFilePrinter >> CompileExternalPlugin [
	| res |
	res:=LibC runCommand: (String streamContents: [:s| 
		s << 'gcc -shared -I./pharo-local/iceberg/hogoww/ASTC/vmHeader -o ./generated/' << fileName << '.so -fPIC ./generated/' << fileName <<'.c'
	<< (virtualMachine for32bit: [ ' -m32'] for64bit: [''])]). 
 	res = 0
	ifFalse:[self error:'plugin didn''t compile (or the comand line sucks)'].
]

{ #category : #accessing }
ASTCFilePrinter >> classDictionary [
	^ classDictionary
]

{ #category : #accessing }
ASTCFilePrinter >> classDictionary: aCollection [
	classDictionary := aCollection
]

{ #category : #accessing }
ASTCFilePrinter >> fileName [
	^ fileName
]

{ #category : #accessing }
ASTCFilePrinter >> fileName: aString [
	fileName := aString
]

{ #category : #printing }
ASTCFilePrinter >> initialize [ 
	virtualMachine := VirtualMachine new.
]

{ #category : #accessing }
ASTCFilePrinter >> isPrimitive [
	^isPrimitive
]

{ #category : #accessing }
ASTCFilePrinter >> isPrimitive: aBoolean [
	^isPrimitive := aBoolean
]

{ #category : #moving }
ASTCFilePrinter >> moveInVmDirectory [
	| res |
	res:=LibC runCommand: (String streamContents: [:s| s << 'mv ./generated/' << fileName << '.so ~/Pharo/vms/70-x'
		<< (virtualMachine for32bit: [ '86'] for64bit: ['64']) <<'/lib/pharo/5.0-201901051900']). 
	res = 0
	ifFalse:[self error:'plugin didn''t move for some reason'].
]

{ #category : #printing }
ASTCFilePrinter >> printInFile [
	| file |
	file:=(FileSystem workingDirectory / 'generated') ensureCreateDirectory.
	file:= file / (fileName,'.c').
	file exists ifTrue:[file delete].
	file writeStreamDo:[:stream |
		isPrimitive ifTrue:[	self printPrePluginStuff:stream withMethods: classDictionary ].

		classDictionary do:[:each| stream << (ASTCDeclarationStatement new declaration: each declaration ; yourself) prettyPrint. stream cr.].
		stream cr cr.
		classDictionary do:[:each | stream << each prettyPrint. stream cr cr].

		isPrimitive ifTrue:[self printPostPluginStuff:stream withMethods: classDictionary ].
	].
]

{ #category : #printing }
ASTCFilePrinter >> printPostPluginStuff: aStream withMethods: collectionOfMethods [
	self flag:'internalPlugin'. "not needed for external plugin, so ignored for now"
	true ifTrue:[^self].
	
	"###############################################"
	"###############################################"
	aStream << 
'static char _m[] = "' << fileName<<'";
void* MyBadPlugin_exports[][3] = {
'.
	collectionOfMethods do:[:each|
		aStream tab << '{(void*)_m, ' << '"' << each declaration id prettyPrint << '", (void*)' << each declaration id prettyPrint<< '},'. 
		aStream cr.
	 ].

aStream <<'	{(void*)_m, "getModuleName", (void*)getModuleName},
	{(void*)_m, "setInterpreter", (void*)setInterpreter},
	{NULL, NULL, NULL}
};

'

]

{ #category : #printing }
ASTCFilePrinter >> printPrePluginStuff: aStream withMethods: collectionOfMethods [
	aStream << 
'
#include "config.h"
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#define true 1
#define false 0
#define null 0  /* using ''null'' because nil is predefined in Think C */

#include "sqMemoryAccess.h"
#include "sqVirtualMachine.h"	/*  The virtual machine proxy definition */
#include "sqPlatformSpecific.h"	/* Platform specific definitions */

struct VirtualMachine* interpreterProxy;
static const char *moduleName = "'<< fileName <<' * VMMaker.oscog-eem.2520 (e)";

const char* getModuleName(void)
{
	printf("\n\n #moduleName# \n\n");
	return moduleName;
}


/*	Note: This is coded so that it can be run in Squeak. */

	/* InterpreterPlugin>>#setInterpreter: */
sqInt setInterpreter(struct VirtualMachine *anInterpreter)
{
	printf("\n\n #interpreter# \n\n");
    sqInt ok;

	interpreterProxy = anInterpreter;
	ok = ((interpreterProxy->majorVersion()) == (VM_PROXY_MAJOR))
	 && ((interpreterProxy->minorVersion()) >= (VM_PROXY_MINOR));
	if (ok) {
			}
	return ok;
}

'

]