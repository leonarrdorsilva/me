/*Baseado no algoritmo desenvolvido no exercicio1, altere-o para que ele pare a
execu��o se encontrar a letra F no array. Ao parar a execu��o ele deve mostrar
quantas letras conseguiu ler at� aquele momento e quantas letras faltaram
analisar.*/

#include 'protheus.ch'
user function letras()

Local aLetras := {'A','A','C','F','D','T','J'}
Local nX
Local nTotal :=0

    for nX := 1 to len(aLetras) 
        if aLetras[nX] == 'F'
             
            exit
        endif
        
        nTotal ++
     next nX
     
     Alert("Numero de letras lidas: "+cValToChar(nTotal))
     Alert("Faltou n�: "+cValToChar(len(aLetras) - nTotal) + " de Letras") 


    
return