/*Escreva um algoritmo para ler as notas da 1a. e 2a. avalia��es de um aluno,
calcule e imprima a m�dia (simples) desse aluno. S� devem ser aceitos valores
v�lidos durante a leitura (0 a 10) para cada nota.*/

#include 'protheus.ch'

user function Media()

local nvalor1, nvalor2:= 0
local cNome := ""
local lrepete := .T.

//While lrepete
    //nvalor1:= nvalor2 := -1

     cNome   := (FWInputBox("Digite o nome do Aluno"))
     nvalor1 := Val(FWInputBox("Digite a primeira nota"))
     

            While nvalor1 < 0 .or. nvalor1 > 10
               nvalor1 := Val(FWInputBox("A primeira nota deve ser de 0 � 10"))  
            End do
           
     nvalor2 := Val(FWInputBox("Digite a segunda nota"))
           While nvalor2 < 0 .or. nvalor2 > 10
               nvalor2 := Val(FWInputBox("A segunda nota deve ser de 0 � 10"))  
            End do

     Alert("O Aluno "+cNome+" fechou com a M�dia de: " + cValToChar((nvalor1 + nvalor2) /2))

     //lrepete:= MSGYESNO("Deseja calcular novamente","") perguntar para o usu�rio se ele quer repetir
 
Return

