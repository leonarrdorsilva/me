#include 'protheus.ch'
/*
1) Escreva um algoritmo que tenha um array de letras. O algoritmo deve avaliar
quantas letras o array tem em seu conte�do e mostrar essa informa��o na tela
para o usu�rio.

2) Baseado no algoritmo desenvolvido no exerc�cio 1, altere-o para que ele ignore
a letra A e a letra B n�o devendo coloca-las na contagem das letras.*/

user function arrayletras()

Local aLetras := {'F','A','C','G','D','T','J'}
Local nX
Local nTotal :=0

    for nX := 1 to len(aLetras)

        if aLetras[nX] <> 'A' .and. aLetras[nX] <> 'B'
            nTotal ++
            endif

     next nX
    Alert (nTotal)
return