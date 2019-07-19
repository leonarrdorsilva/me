/*Baseado no algoritmo desenvolvido no exercicio1, altere-o para que ele pare a
execução se encontrar a letra F no array. Ao parar a execução ele deve mostrar
quantas letras conseguiu ler até aquele momento e quantas letras faltaram
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
     Alert("Faltou n°: "+cValToChar(len(aLetras) - nTotal) + " de Letras") 


    
return