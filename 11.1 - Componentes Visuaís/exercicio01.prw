/*Crie uma janela com um botão de fechar. Ao clicar nesse botão a janela deverá
ser fechada.*/

#include 'protheus.ch'

User function VisExe1()
Local oDlg 
Local cTitulo   := 'Exercicio 1'
Local oFont
Local oGet


DEFINE MSDIALOG oDlg TITLE cTitulo FROM 000,000 TO 600,800 PIXEL

// Cria Fonte para visualização
oFont := TFont():New('Courier new',,-18,.T.)
 
// Cria o Objeto tSay usando o comando @ .. SAY

@110,170 BUTTON "Fechar" FONT oFont SIZE 080, 047 PIXEL OF oDlg ACTION u_oBotao(oDlg)

ACTIVATE MSDIALOG oDlg CENTERED

User Function oBotao(oDlg,cNome)
oDlg:End()
Return

Return