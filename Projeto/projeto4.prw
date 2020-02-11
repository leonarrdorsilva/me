#include 'protheus.ch'
 #include 'fwmvcdef.ch'


// -------------------------------ALBUM -------------------------------
user function projeto4() //ALBUM
    local oBrowse := FWMBrowse():New() //Criar browse

    oBrowse:SetAlias('ZA3')
    oBrowse:SetMenuDef('projeto4') //nome da fonte

    oBrowse:Activate() // ativar o browse

Return

Static Function Menudef()
Return FWMVCMenu('projeto4') //Menu padrão com C.R.U.D. //nome da fonte

Static function ModelDef() //sempre staticfunction
    local oModel := MPFormModel():New('ZA3MODEL')
    local oStruZA3 := FWFormStruct(1,'ZA3') //cria estrutura
    local oStruZA4 := FWFormStruct(1,'ZA4') //cria estrutura
    local oStruZA5 := FWFormStruct(1,'ZA5') //cria estrutura
    local bAlbum := {|oModelField| vldAlbum(oModelField)}

    oModel:AddFields('ZA3MASTER',/*Owner*/ ,oStruZA3,/**/, bAlbum) // adiciona
    oModel:AddGrid('ZA4DETAIL', 'ZA3MASTER', oStruZA4, , )
    oModel:AddGrid('ZA5DETAIL', 'ZA3MASTER', oStruZA5, , )
    

    oModel:SetRelation( 'ZA4DETAIL', { {'ZA4_FILIAL', "xFilial('ZA4')"},{"ZA4_ALBUM","ZA3_ALBUM"} }, ZA4->( IndexKey( 1 ) ) )    
    oModel:SetRelation( 'ZA5DETAIL', { {'ZA5_FILIAL', "xFilial('ZA5')"},{"ZA5_ALBUM","ZA4_ALBUM"} }, ZA5->( IndexKey( 1 ) ) )

    oModel:GetModel('ZA3MASTER'):SetDescription('Album')
    oModel:GetModel('ZA4DETAIL'):SetDescription('Musicas do album')
    oModel:GetModel('ZA5DETAIL'):SetDescription('Autores/Interpretes')

    oModel:GetModel( 'ZA4DETAIL' ):SetUniqueLine( { 'ZA4_MUSICA' } ) 
    oModel:GetModel( 'ZA5DETAIL' ):SetUniqueLine( { 'ZA5_INTER' } )
Return oModel

Static Function ViewDef() //sempre static function

    local oView := FWFormView():New() //objeto da view
    local oStruct := FWFormStruct(2,'ZA3')
    local oStructZA4 := FWFormStruct(2,'ZA4')
    local oStructZA5 := FWFormStruct(2,'ZA5')

    oView:SetModel(ModelDef()) // linka a view com o model

    oView:AddField('ZA3_VIEW', oStruct, 'ZA3MASTER')
    oView:AddGrid('ZA4_VIEW', oStructZA4, 'ZA4DETAIL')
    oView:AddGrid('ZA5_VIEW', oStructZA5, 'ZA5DETAIL')

    oStructZA5:RemoveField('ZA5_ALBUM')
    oStructZA5:RemoveField('ZA5_MUSICA')

    oView:CreateHorizontalBox('BOXZA3', 40)
    oView:CreateHorizontalBox('BOXZA4', 30) 
    oView:CreateHorizontalBox('BOXZA5', 30)

    oView:SetOwnerView('ZA3_VIEW','BOXZA3') //colocar um componente no outro
    oView:SetOwnerView('ZA4_VIEW','BOXZA4') //colocar um componente no outro
    oView:SetOwnerView('ZA5_VIEW','BOXZA5') //colocar um componente no outro
    
    oView:EnableTitleView('ZA4_VIEW')
    oView:EnableTitleView('ZA5_VIEW')
Return oView

Static Function vldAlbum(oModelField)
    local lOK := .T.
    local cNome := oModelField:GetValue("ZA3_DESCRI")
    local dCriar := oModelField:GetValue("ZA3_DATA")

    If EMPTY(cNome)
        lOK := .F.
        HELP(,, 'Descrição',, 'O nome do álbum está vazio',1,0,,,,,, {"Preencha o campo Descrição"})
    ElseIf dCriar > DATE()
        lOK := .F.
        HELP(,, 'Data de Criação',, 'Data de criação não pode ser maior que a data atual',1,0,,,,,, {"Exemplo: " + CRLF + "Data de Hoje: " + dToC(DATE()) + CRLF + "Data de Criação: 01/01/2010"})
    ElseIf EMPTY(dCriar)
        lOK := .F.
        HELP(,, 'Data de Criação',, 'A data não pode ser vazia',1,0,,,,,, {"Preencha o campo Data"})
    Endif
Return lOK