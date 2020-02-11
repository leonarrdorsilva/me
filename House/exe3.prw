#include "Protheus.ch"

user Function  simpleArraySum()

local aArray := {}
local nX,nValor:=0
Local nSoma := 0
Local nQtd:= Val(FWInputbox("Insira a quantidade de numeros a serem contados:"))

for nX := 1 to (nQtd) 
nValor := Val(FWInputbox("Insira o :"+ CValtoChar(nX) + " numero")) 
 aAdd(aArray, nValor) 
next nX 

For nX:= 1 to Len(aArray)
nSoma:= nSoma + aArray[nX]
Next nX 

Alert (nSoma)
Return