#include "protheus.ch"

user Function MediaAlu()

Local  nNum1 := 0
Local  nNum2 := 0
Local  nNum3 := 0
Local  nMedia:= 0
Local cNomeAluno := 0

        cNomeAluno:= FWInputBox("Digite o nome do aluno: ")
        nNum1 := Val(FWInputBox("Digite aqui o primeiro n�mero"))
        nNum2 := Val(FWInputBox("Digite aqui o segundo n�mero"))
        nNum3 := Val(FWInputBox("Digite aqui o terceiro n�mero"))

        nMedia:= ((nNum1*2 + nNum2 *3 + nNum3 *5)/10)

        Alert("A media ponderada do "+ cNomeAluno +" �: " + cValToChar(nMedia))
        Return

 




