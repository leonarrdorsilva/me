#include 'Protheus.ch'


user Function solveMeFirst()

local nValor1,nValor2,nTotal := 0
    
    nValor1:= Val(FWInputBox("Digite o primeiro valor a ser somado"))
    nValor2:= Val(FWInputBox("Digite o segundo valor a ser somado"))
    
    nTotal := nValor1 + nValor2
     
     Alert (nTotal)
Return