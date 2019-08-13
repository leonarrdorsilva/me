#include 'Protheus.ch'

User Function Autor01()

Local oBrowse := FWMBrowse():New()

oBrowse:SetAlias("ZA0")
oBrowse:SetMenuDef('mvcAutor')//sempre colocar o mesmo nome no menudef. e na fun��o que retorna o menudef

oBrowse:Activate()// para INICIALIZAR O OBJETO edit


Return

Static Function Menudef()//padr�oooooo 

//Local aRotina := FWMVCMenu("mvc01") //Menu padr�o C.R.U.D

Return FWMVCMenu("mvcAutor")

//MVC - Model(Dados e regra de neg�cio)
//      View (Interface)
//      Controller (Dentro da Lib)

Static Function ModelDef()
Local oModel := MPFormModel():New("ZA0MODEL")
Local oStruZA0:= FwFormStruct(1,"ZA0")
Local bPos := {|oModelField|PosVldAutor(oModelField)}
//FormField (Campo dp Formul�rio)
oModel:AddFields("ZA0MASTER",/* owner */,oStruZA0,/**/,bPos)

//Est� utilizando o modelo da Z A0 contido no oStruZA0
Return oModel

Static Function PosVldAutor(oModelField)
local lTudoOk :=.T.//
local dFalec := oModelField:GetValue("ZA0_DTAFAL")
local cNome := oModelField:GetValue("ZA0_NOME")
//Para atribuir valor SetValue(encapsulamento)
    If dFalec > Date()
        lTudoOk := .F. 
        Help(,, 'HELP',,'N�o adivinhe o futuro',1,0,,,,,,{"Informe outra data menor ou igual � " + dtoc(date())})
        //Help exove a omterface de akida   
    ElseIF 'RICARDO' $ UPPER(cNome) .Or. Empty(cNome)//$ = se o texto est� contido em outro.
        lTudoOk:= .F.
        Help(,,'HELP',,'Ele n�o pode estar aqui',1,0)
    EndIf
                                                                                                                                                                              
Return lTudoOk

Static Function ViewDef()//
Local oView:= FWFormView():New()//
Local oStruct:= FwFormStruct(2,"ZA0")

oView:SetModel(ModelDef())//Return Do ModelDef para SetModel
               //ID      ,ESTRUTURA, ID DO MODEL
oView:AddField("ZA0_VIEW",oStruct,"ZA0MASTER",/* */,)
oView:CreateHorizontalBox("BOXZA0",100)//taxa de exibi��o na tela.
oView:SetOwnerView("ZA0_VIEW","BOXZA0")

Return oView

