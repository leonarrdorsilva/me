#include "protheus.ch"
/*Escreva um algoritmo para ler 2 valores e se o segundo valor informado for
ZERO, deve ser lido um novo valor, ou seja, para o segundo valor não pode ser
aceito o valor zero e imprimir o resultado da divisão do primeiro valor lido pelo
segundo valor lido.*/

User Function LerValores()
//Inicío
    local nValor1 := Val(FWInputBox("Insira o primeiro Valor"))
    local nValor2 := Val(FWInputBox("Insira o segundo Valor"))
    local nTotal :=0
    local nContador :=0

    While nValor1 == 0 .and. nValor2 == 0
        if nValor1 ==0 
             nValor1 := Val(FWInputBox("Insira o primeiro Valor"))
        EndIf 

        if nValor2 ==0 
            nValor2 := Val(FWInputBox("Insira o segundo Valor"))
        EndIf
        nContador++ //para iniciar a contagem
        
        if nContador == 3
            Alert ('para exibir uma mensagem para o usuário.')
        
        EndIf

    End do
    /*
    While nValor2 == 0 
        
    End do
    */
    Alert(cValtoChar(nValor1/nValor2))

    Return

    
        
