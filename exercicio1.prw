#include "protheus.ch"

/* Ler um valor e escrever a mensagem É MAIOR QUE 10! se o
valor lido for maior que 10, caso contrário escrever NÃO É
MAIOR QUE 10.*/

User Function Avaliar()
Local nValor:=Val(FWInputbox("Insira um número: "))//ENTRADA

//PROCESSAMENTO

    If nValor > 10 
        Alert("É maior que 10!")// SAÍDA
    else
        alert("Não é maior que 10!")//SAIDA
    EndIf
//PROCESSAMENTO
return  