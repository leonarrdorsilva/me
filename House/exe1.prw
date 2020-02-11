#include 'Protheus.ch'

//INÍCIO
User Function Brithday()
Local altvelas:= {}
Local nX 
Local nTotal := 0
Local mVela := 0
Local nVelas:= Val(FWInputbox("Insira a quantidade de velas:"))//Pergunto ao usuário a quantidade de velas
Local nValor:=0

 //PROCESSAMENTO
 /* Aqui coloco um For para criar o array com a quantidade 
 de velas informada em cima*/
for nX := 1 to (nVelas) 
 
 nValor := Val(FWInputbox("Insira a altura da vela de n:"+ CValtoChar(nX))) //Aqui perguntar a altura das velas
 aAdd(altvelas, nValor)// aqui eu criei um aAdd que adiciona valores ao array enquanto naão atingir a qtde de velas desejadas.
    next nX // Incremento para o contador


for nX := 1 to len(altvelas) // aqui recebemos o tamanho do array
        
        if altvelas[nX] > mVela // façõ uma condição , se o vetor na posição autal do contador for maior que mvela , ele irá guardar.
            mVela := altvelas[nX]
            nTotal := 1  //Aqui ele incrementa caso no total o valor 1, sempre que ele achar um numero maior ele entra aqui.
         elseif mVela == altvelas[nX] //caso ele passe do if ele compara os dois valores para ver se é igual se for ele incrementa +1
            nTotal ++
        endif
     next nX
     //SAÍDA
    Alert (nTotal)  // Aqui mostro para o usuário quantas velas ele podera apagar.
return






