#include "protheus.ch"

/* Ler um valor e escrever a mensagem � MAIOR QUE 10! se o
valor lido for maior que 10, caso contr�rio escrever N�O �
MAIOR QUE 10.*/

User Function Avaliar()
Local nValor:=Val(FWInputbox("Insira um n�mero: "))//ENTRADA

//PROCESSAMENTO

    If nValor > 10 
        Alert("� maior que 10!")// SA�DA
    else
        alert("N�o � maior que 10!")//SAIDA
    EndIf
//PROCESSAMENTO
return  