/*Acrescente uma mensagem 'NOVO CÁLCULO (S/N)?' ao final do exercício
anterior. Se for respondido 'S' deve retornar e executar um novo cálculo, caso
contrário deverá encerrar o algoritmo.*/
#include 'protheus.ch'

user function Media2()

local nvalor1, nvalor2:= 0
local cNome := ""
local lrepete := .T.

While lrepete


     cNome   := (FWInputBox("Digite o nome do Aluno"))
     nvalor1 := Val(FWInputBox("Digite a primeira nota"))
     

            While nvalor1 < 0 .or. nvalor1 > 10
               nvalor1 := Val(FWInputBox("A primeira nota deve ser de 0 á 10"))  
            End
           
     nvalor2 := Val(FWInputBox("Digite a segunda nota"))
           While nvalor2 < 0 .or. nvalor2 > 10
               nvalor2 := Val(FWInputBox("A segunda nota deve ser de 0 á 10"))  
            End

     Alert("O Aluno "+cNome+" fechou com a Média de: " + cValToChar((nvalor1 + nvalor2) /2))

    lrepete:= MSGYESNO("Deseja calcular novamente") //perguntar para o usuário se ele quer repetir
    End
 
Return

