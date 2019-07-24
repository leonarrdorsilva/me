#include 'Protheus.ch'
//Criar uma função que receba dois números reais e retorne seu produto.

User Function Func02()

local nvalor1,nvalor2,nRes := 0 

    nvalor1:=Val(FWInputBox('Insira o 1° Valor')) 
    nvalor2:=Val(FWInputBox('Insira o 2º Valor'))
    
    nRes:= u_funX(nValor1,nValor2)
    
    Alert (nRes)

Return

User Function funX(nValor1,nValor2)
    local nRet:=0
        nRet:= nValor1 * nValor2
Return nRet