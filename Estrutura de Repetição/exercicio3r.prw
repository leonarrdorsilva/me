/*Acrescente uma mensagem 'NOVO C�LCULO (S/N)?' ao final do exerc�cio
anterior. Se for respondido 'S' deve retornar e executar um novo c�lculo, caso
contr�rio dever� encerrar o algoritmo.*/
#include 'protheus.ch'

user function Media2()

local nvalor1, nvalor2:= 0
local cNome := ""
local lrepete := .T.

While lrepete


     cNome   := (FWInputBox("Digite o nome do Aluno"))
     nvalor1 := Val(FWInputBox("Digite a primeira nota"))
     

            While nvalor1 < 0 .or. nvalor1 > 10
               nvalor1 := Val(FWInputBox("A primeira nota deve ser de 0 ate 10"))  
            End
           
     nvalor2 := Val(FWInputBox("Digite a segunda nota"))
           While nvalor2 < 0 .or. nvalor2 > 10
               nvalor2 := Val(FWInputBox("A segunda nota deve ser de 0 ate 10"))  
            End

     Alert("O Aluno "+cNome+" fechou com a Média de: " + cValToChar((nvalor1 + nvalor2) /2))

    lrepete:= MSGYESNO("Deseja calcular novamente") //perguntar para o usu�rio se ele quer repetir
    End
 
Return

