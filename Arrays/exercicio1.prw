#include 'protheus.ch'

/*Criar um array para guardar o nome de 5 alunos, os nomes dever�o ser colocados no
array depois da declara��o do mesmo, inserindo um valor de cada vez. Exiba o nome
do terceiro aluno. */
    User Function AddNome ()

    Local aAluno := {}
    
    aAdd(aAluno,  "Leonardo")
    aAdd(aAluno, "Carlos")
    aAdd(aAluno, {"Leandro",10})//Sempre colocar {} para criar um array dentro de um array
    aAdd(aAluno, "Junior")
    aAdd(aAluno, "Francielly")

    Alert ("Nome do Aluno:"+aAluno[3,1]+ " Idade:" +cValToChar(aAluno[3,2]))


Return