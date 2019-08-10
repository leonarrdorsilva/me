#include 'protheus.ch'

user function projeto1()
local oBrowse := FWMBrowse():New() //Criar browse

oBrowse:SetAlias('ZA0')
oBrowse:SetMenuDef('projeto1')

oBrowse:Activate() //ativar o browse

Return

Static Function Menudef()

Return FWMVCMenu('projeto1') //Menu padrão com C.R.U.D.

Static function ModelDef() //sempre staticfunction
local oModel := MPFormModel():New('ZA0MODEL')
local oStruZA0 := FWFormStruct(1,'ZA0') //cria estrutura
local bPos := {|oModelField| PosVldAutor(oModelField) } 

oModel:AddFields('ZA0MASTER',/*Owner*/ ,oStruZA0,/**/, bPos) // adiciona
Return oModel

Static Function PosVldAutor(oModelField)
    local lTudoOk := .T.
    local dFalec := oModelField:GetValue('ZA0_DTAFAL') //Validação da Data
    local cNome := oModelField:GetValue('ZA0_NOME') // Validação do Nome
    local cTipo := oModelField:GetValue("ZA0_TIPO ")
        
    If dFalec > Date() //Condição para a validação da Data 
        lTudoOk := .F.
        Help(, , "Erro", , "Informe outra data", 1, 0, , , , , , {"Digite uma data válida de falecimento"})
    EndIf    
    If Empty(cNome)
        lTudoOk := .F.
        Help(, ,"Erro", , "Campo nome em branco", 1, 0, , , , , , {"Preencha o campo Nome"})
    EndIf
    If Empty(cTipo)
        lTudoOk:= .F.
        Help(, ,"Erro", , "o campo Tipo esta inválido", 1, 0, , , , , , {"Defina o tipo: Autor ou Interprete"})
    EndIf
    
    
return lTudoOk

Static Function ViewDef() //sempre static function
local oView := FWFormView():New() //objeto da view
local oStruct := FWFormStruct(2,'ZA0')

oView:SetModel(ModelDef()) // linka a view com o model
oView:AddField('ZA0_VIEW', oStruct, 'ZA0MASTER')
oView:CreateHorizontalBox('BOXZA0', 100)
oView:SetOwnerView('ZA0_VIEW','BOXZA0') //colocar um componente no outro

Return oView