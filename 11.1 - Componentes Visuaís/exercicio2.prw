#include 'protheus.ch'

/*Crie uma janela com 2 campos do tipo GET para solicitar o nome de um usuário

e sua senha. Adicione um botão de OK e um de cancelar. Ao clicar em OK deve-
se avaliar se a senha é igual a "IOS2019", caso seja, exibir uma mensagem de
senha correta. Se estiver errado exibir uma mensagem de senha incorreta. Ao
clicar em cancelar deve-se fechar a janela*/

user function VisExe2()
Local oDlg 
Local cTitulo:= 'Exemplo 2'
Local oFont
Local oSay
Local oGet
Local cNome := Space(100)
Local cPass := Space(10)


DEFINE MSDIALOG oDlg TITLE cTitulo FROM 000,000 TO 600,800 PIXEL

// Cria Fonte para visualização
oFont := TFont():New('Courier new',,-18,.T.)
 
// Cria o Objeto tSay usando o comando @ .. SAY
@ 10,10 SAY oSay PROMPT 'Nome:' SIZE 200,20 COLORS CLR_RED,CLR_WHITE FONT oFont OF oDlg PIXEL
@ 50,10 SAY oSay PROMPT 'Senha:' SIZE 200,20 COLORS CLR_RED,CLR_WHITE FONT oFont OF oDlg PIXEL
 
@ 10,50 GET oGet VAR cNome FONT oFont SIZE 200,20 OF oDlg PIXEL VALID !empty(cNome) 
@ 50,50 GET oGet VAR cPass FONT oFont SIZE 50,20 OF oDlg PIXEL VALID !empty(cPass) PASSWORD
 
@150,80 BUTTON "Validar" FONT oFont SIZE 080, 047 PIXEL OF oDlg ACTION u_ValPass(cPass)
@150,170 BUTTON "Cancelar" FONT oFont SIZE 080, 047 PIXEL OF oDlg ACTION oDlg:End()

ACTIVATE MSDIALOG oDlg CENTERED

Return

user function ValPass(cPass)
//Ao clicar em OK deve-
/* se avaliar se a senha é igual a "IOS2019", caso seja, exibir uma mensagem de
senha correta. Se estiver errado exibir uma mensagem de senha incorreta. Ao
clicar em cancelar deve-se fechar a janela*/

//default cPass := "" caso o usuário não passe um valor.
If AllTrim(Upper(cPass)) ==('IOS2019')
    Alert("Senha Correta")
    elseif Alert("Senha Incorreta!")
EndIf
    
Return cPass