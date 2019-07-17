#include "protheus.ch"

/*Crie um array com três linhas. Em cada linha deve-se ter o nome do aluno e um
outro array, pra guardar 4 notas de prova. Popule o array inteiro. Exiba o nome e as
notas do segundo aluno.*/

user Function array4()

local aAluno := Array(3,5)
        
        aAluno[1]:= {"Lucas",10,22,4,5}
        aAluno[2]:= {"Wualace",2,30,4,8}
        aAluno[3]:= {"Castanhari",10,22,10,9}

        Alert("Nome do aluno: " +aAluno[2,1] + " Nota 1: " + cValToChar(aAluno[2,2]) +;
        " Nota 2: " + cValToChar(aAluno[2,3]) +" Nota 3: " +cValToChar(aAluno[2,4]) +;
        " Nota 4: " +cValToChar(aAluno[2,5])) 

        Return
       