#include 'protheus.ch'
/*Criar um array de 3 linhas e 2 colunas, cada linha deve guardar o nome de um aluno
e a idade do mesmo. Exiba os dados do segundo aluno.*/


User Function Array2()
// Vari�veis

Local aAluno2 := {} // Array (3,2) definir o tamanho do array

//Inicío

    aAdd(aAluno2, {"Leonardo",10})
    aAdd(aAluno2, {"Carlos",15})
    aAdd(aAluno2, {"Eduardo",30})
    
    Alert("Nome:"+ aAluno2[2,1] + " Idade:"+cValToChar(aAluno2[2,2]))


Return