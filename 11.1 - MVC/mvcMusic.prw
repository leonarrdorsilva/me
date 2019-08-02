#include 'Protheus.ch'

User Function Music02()

    Local oBrowse := FWMBrowse():New()
    oBrowse:SetAlias("ZA1")
    oBrowse:SetMenuDef('mvcMusic')
    oBrowse:Activate()// para INICIALIZAR O OBJETO

Return
 
Static Function Menudef()//padrãoooooo

Return FWMVCMenu("mvcMusic")// EXIBIR O C.R.U.D

Static Function ModelDef()
    Local oModel := MPFormModel():New("ZA1MODEL")
    Local oStruZA1:= FwFormStruct(1,"ZA1")
    Local oStruZA2:= FwFormStruct(1,"ZA2")
    local bValid:= {|oModelGrid|ValidAutor(oModelGrid)}
   // Local bPos := {|oModelField|PosValMusic(oModelField)}
    //
    
    oModel:AddFields("ZA1MASTER",/* owner  */,oStruZA1,/**/)
    oModel:AddGrid( 'ZA2DETAIL', 'ZA1MASTER', oStruZA2, ,bValid ) 
    oModel:SetRelation('ZA2DETAIL', { {'ZA2_FILIAL', "xFilial('ZA2')"},;
 {"ZA2_MUSICA" , "ZA1_MUSICA"} }, ZA2->( IndexKey( 1 ) ) )

    oModel:GetModel('ZA1MASTER'):SetDescription('Dados da Música')
    oModel:GetModel('ZA2DETAIL'):SetDescription('Dados do Autor da Música')

Return oModel

Static Function ValidAutor(oModelGrid)
local lret:= .F.
local cCodAutor := oModelGrid:GetValue("ZA2_AUTOR")
Local aArea := GetArea() //guarda estado da area de trabalho ativa
Local aAreaZA0 := ZA0->(GetArea())

DbSelectArea("ZA0")
ZA0->(DbSetOrder(1))
If ZA0->(DBSeek(xFilial("ZA0") + PADR(cCodAutor),TamSX3('ZA0_CODIGO')[1]))
    If ZA0 ->
        
    EndIf
    
    
 
        
    EndIf

RestArea(aArea)
Return lret

Static Function PosValMusic(oModelField)
    local lTudoOk :=.T.//
    local dMusic := oModelField:GetValue("ZA1_DATA")
//Para atribuir valor SetValue(encapsulamento)
    If dMusic > Date()
        lTudoOk := .F. 
        Help(,,'HELP',,'A data escolhida não pode ser',1,0,,,,,,{"Informe outra data menor ou igual á " + dtoc(date())})
    EndIf
                                                                                                                                                                              
Return lTudoOk


Static Function ViewDef()//
    Local oView:= FWFormView():New()//
    Local oStruct:= FwFormStruct(2,"ZA1")
    Local oStructZA2 := FWFormStruct(2,"ZA2")
    oView:SetModel(ModelDef())//Return Do ModelDef para SetModel
               //ID      ,ESTRUTURA, ID DO MODEL
    oView:AddField("ZA1_VIEW",oStruct,"ZA1MASTER")
    oView:AddGrid( 'ZA2_VIEW', oStructZA2, 'ZA2DETAIL' )
    // Define campos que terao Auto Incremento
    oView:AddIncrementField('ZA2_VIEW', 'ZA2_ITEM' )

    oView:CreateHorizontalBox("BOXZA1", 50)//taxa de exibição na tela.
    oView:CreateHorizontalBox("BOXZA2", 50)

    oView:SetOwnerView("ZA1_VIEW","BOXZA1")
    oView:SetOwnerView("ZA2_VIEW","BOXZA2") 
    
    oView:EnableTitleView('ZA2_VIEW') //habilita a descricao do submodelo

Return oView