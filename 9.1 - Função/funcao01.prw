#include 'protheus.ch'
//Criar uma fun��o que receba dois inteiros e retorne sua soma.

User Function func01()

local nvalor1,nvalor2,nRes := 0 

    nvalor1:=Val(FWInputBox('Insira o 1� Valor')) 
    nvalor2:=Val(FWInputBox('Insira o 2� Valor'))
    
    nRes:= u_funSoma(nValor1,nValor2)
    
    Alert (nRes)


Return


User Function funSoma(nValor1,nValor2)
    local nRet:=0
        nRet := nValor1 + nValor2
Return nRet



