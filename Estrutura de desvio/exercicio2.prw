#include "protheus.ch"
//Ler dois valores (considere que n�o ser�o lidos valores iguais)e escrever o maior deles

User Function Avaliar2()

    Local nValor1:=Val(FWInputbox("Insira um n�mero: "))//ENTRADA
    Local nValor2:=Val(FWInputbox("Insira o segundo n�mero: "))//ENTRADA

//PROCESSAMENTO

    If nValor1 > nValor2 
        Alert(cValToChar(nValor1)+" � maior que "+cValToChar(nValor2)+"!")// SA�DA
    else
        alert(cValToChar(nValor2)+" � maior que "+cValToChar(nValor1)+"!")//SAIDA
    EndIf
//PROCESSAMENTO
Return