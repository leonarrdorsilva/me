#include "protheus.ch"
//Ler dois valores (considere que não serão lidos valores iguais)e escrever o maior deles

User Function Avaliar2()

    Local nValor1:=Val(FWInputbox("Insira um número: "))//ENTRADA
    Local nValor2:=Val(FWInputbox("Insira o segundo número: "))//ENTRADA

//PROCESSAMENTO

    If nValor1 > nValor2 
        Alert(cValToChar(nValor1)+" É maior que "+cValToChar(nValor2)+"!")// SAÍDA
    else
        alert(cValToChar(nValor2)+" É maior que "+cValToChar(nValor1)+"!")//SAIDA
    EndIf
//PROCESSAMENTO
Return