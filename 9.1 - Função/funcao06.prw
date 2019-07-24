#include 'protheus.ch'

/*Criar uma função que recebe a altura (alt) e o sexo de uma pessoa e retorna o seu
peso ideal. Para homens, calcular o peso ideal usando a fórmula peso ideal = 72.7 x alt
- 58 e, para mulheres, peso ideal = 62.1 x alt - 44.7.*/

user function Peso()
//------------------------------------
//ENTRADA DE DADOS
//receber (ou definir) o peso e a altura
//receber o sexo da pessoa

 Local nAltura:= Val(FWInputBox("Digite a altura: !"))
Local cSexo:= FWInputBox("Digite M para masculino e F para Feminino")
Local nPeso

nPeso := u_calculo(nAltura, cSexo)
//------------------------------------
//PROCESSAMENTO DE DADOS
alert (nPeso)
Return

//processa o peso ideal
//------------------------------------
user function calculo (nAlt,cSexo)
/* Para homens= 72.7 x alt 58
mulheres, peso ideal = 62.1 x alt - 44.7.*/
local nRet := 0
    If Upper(cSexo) == 'M'

        nRet:= 72.7 * nAlt - 58 
    elseif Upper(cSexo) == 'F'
     nRet:= 62.1 * nAlt - 44.7  
    EndIf
//SAIDA DE DADOS
Return nRet
//------------------------------------




