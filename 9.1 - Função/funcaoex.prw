#include 'protheus.ch'

user function Calc()

Local aPessoas :={}
Local cMensagem := ''
Local nX :=1

aADD(aPessoas, {1.56, 'M',0})
aADD(aPessoas, {2,    'F',0})
aADD(aPessoas, {1.60, 'M',0})
aADD(aPessoas, {2.89, 'F',0})
aADD(aPessoas, {1.84, 'F',0})

for nX := 1 to Len(aPessoas)
    aPessoas[nX,3] := u_calculo(aPessoas[nX,1], aPessoas[nX,2])
    cMensagem += "O peso ideal da pessoa "+cValToChar(nX)+ " é " + STR(aPessoas[nX,3],6,2) + CRLF
next

alert (cMensagem)
Return


