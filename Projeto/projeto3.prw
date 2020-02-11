#include 'protheus.ch'
#include 'fwmvcdef.ch'
// -------------------------------PLAYLIST -------------------------------
user function projeto3()
    local oBrowse := FWMBrowse():New() //Criar browse
    oBrowse:SetAlias('ZA7') //PLAYLIST
    oBrowse:SetMenuDef('projeto3')
    oBrowse:Activate() // ativar o browse
Return

Static Function Menudef()
Return FWMVCMenu('projeto3') //Menu padrão com C.R.U.D. //nome da fonte


Static function ModelDef() //sempre staticfunction
    local oModel := MPFormModel():New('ZA7MODEL')
    local oStruZA7 := FWFormStruct(1,'ZA7') //cria estrutura
    local oStruZA8 := FWFormStruct(1,'ZA8') //cria estrutura
    local oStruZA2 := FWFormStruct(1,'ZA2') //cria estrutura
    local oStruZA4 := FWFormStruct(1,'ZA4') //cria estrutura
    //Bloco de Validações
    local bValid := {|oModelField| VldPlaylist(oModelField)}
    local bPlay := {|oModelGrid| validaP(oModelGrid)}

        oModel:AddFields('ZA7MASTER',/*Owner*/ , oStruZA7,/**/, bValid) // adiciona
        oModel:AddGrid('ZA8DETAIL', 'ZA7MASTER', oStruZA8, , bPlay)
        oModel:AddGrid('ZA2DETAIL', 'ZA7MASTER', oStruZA2,,)
        oModel:AddGrid('ZA4DETAIL', 'ZA7MASTER', oStruZA4,,)
        
        oModel:SetRelation( 'ZA8DETAIL', { {'ZA8_FILIAL', "xFilial('ZA8')"}, {"ZA8_PLAY" , "ZA7_CODIGO"} }, ZA8->( IndexKey( 1 ) ) )
        
        oModel:GetModel('ZA8DETAIL'):SetDescription('Musicas da Playlist')
        oModel:GetModel('ZA2DETAIL'):SetDescription('Pesquisar Interpretes')
        oModel:GetModel('ZA4DETAIL'):SetDescription('Pesquisar Álbuns')
        oModel:GetModel( 'ZA8DETAIL' ):SetUniqueLine( { 'ZA8_MUSICA' } )
        
        oStruZA2:AddField('SELECT', ' ', 'SELECT', 'L', 1, 0, , , {}, .F.,FWBuildFeature( STRUCT_FEATURE_INIPAD, ".F.")) 
        oStruZA4:AddField('SELECT', ' ', 'SELECT', 'L', 1, 0, , , {}, .F.,FWBuildFeature( STRUCT_FEATURE_INIPAD, ".F."))
        oStruZA4:AddField('DESCRI',' ', 'DESCRI', 'C',100, 0, , , {},.F.,)
        
        oModel:GetModel('ZA2DETAIL'):SetOnlyQuery()
        oModel:GetModel('ZA4DETAIL'):SetOnlyQuery()

        //define que o grid nao é obrigatorio
        oModel:GetModel('ZA2DETAIL'):SetOptional()
        oModel:GetModel('ZA4DETAIL'):SetOptional()
        oModel:SetActivate({|oModel| AfterActivate(oModel)}) 

Return oModel

//--------------------------------------- VIEW-------------------------------------------------
Static Function ViewDef() //sempre static function
    local oView := FWFormView():New() //objeto da view
    local oStruct := FWFormStruct(2,'ZA7')
    local oStructZA8 := FWFormStruct(2,'ZA8') 
    local oStructZA2 := FWFormStruct(2,'ZA2')


    local oStructZA4 := FWFormStruct(2,'ZA4')
    oView:SetModel(ModelDef()) // linka a view com o model
    oStruct:RemoveField('ZA7_FILIAL')
    oStructZA8:RemoveField('ZA8_FILIAL')
    oStructZA8:RemoveField('ZA8_PLAY')
    oStructZA8:RemoveField('ZA8_ALBUM')
    oStructZA2:RemoveField('ZA2_MUSICA')
    oStructZA2:RemoveField('ZA2_ITEM')
    oStructZA4:RemoveField('ZA4_MUSICA')
    oStructZA4:RemoveField('ZA4_TITULO')

    oStructZA2:AddField( 'SELECT','01','SELECT','SELECT',, 'Check')
    oStructZA4:AddField( 'SELECT','01','SELECT','SELECT',, 'Check')
    oStructZA4:AddField( 'DESCRI','03','Nome do Álbum','DESCRI',,'C')
    
    oView:AddField('ZA7_VIEW', oStruct, 'ZA7MASTER')
    oView:AddGrid('ZA8_VIEW', oStructZA8, 'ZA8DETAIL')
    oView:AddGrid('ZA2_VIEW', oStructZA2, 'ZA2DETAIL')
    oView:AddGrid('ZA4_VIEW', oStructZA4, 'ZA4DETAIL') 
    
    oView:AddOtherObject("PANEL_SEL",{|oPanel,oOtherObject| criaButtonSel(oPanel,oOtherObject)})
    oView:AddOtherObject("PANEL_2",{|oPanel,oOtherObject| criaBtn2(oPanel,oOtherObject)})
    
    oView:CreateHorizontalBox('BOXZA7', 30)
    oView:CreateHorizontalBox('BOXZA8', 30) 
    oView:CreateHorizontalBox('ESP1', 30)
    oView:CreateHorizontalBox('ESP2', 10)  

    oView:CreateVerticalBox('BOXZA2', 50, 'ESP1')
    oView:CreateVerticalBox('BOXZA4', 50, 'ESP1')
    oView:CreateVerticalBox("BOX_SEL",50, 'ESP2')
    oView:CreateVerticalBox("BOX_2",50, 'ESP2')    
    
    oView:SetOwnerView('ZA7_VIEW','BOXZA7') //colocar um componente no outro
    oView:SetOwnerView('ZA8_VIEW','BOXZA8') //colocar um componente no outro
    oView:SetOwnerView('ZA2_VIEW','BOXZA2') //colocar um componente no outro
    oView:SetOwnerView('ZA4_VIEW', 'BOXZA4') //colocar um componente no outro
    oView:SetOwnerView('PANEL_SEL','BOX_SEL')
    oView:SetOwnerView('PANEL_2','BOX_2')
    
    oView:EnableTitleView('ZA8_VIEW')
    oView:EnableTitleView('ZA2_VIEW')
    oView:EnableTitleView('ZA4_VIEW')
    
Return oView

//---------------------------------//VALIDAÇÕES//---------------------------------------------------------
Static Function VldPlaylist(oModelField)
    local lOK := .T.
    local cNome := oModelField:GetValue("ZA7_NOME")
    local dCriar := oModelField:GetValue("ZA7_DATA")
    If EMPTY(dCriar) 
        oModelField:SetValue("ZA7_DATA", DATE())
    ElseIf dCriar > DATE()
        lOK := .F.
        HELP(,, 'Data de Criação',, 'Data de criação não pode ser maior que a data atual',1,0,,,,,, {"Exemplo: " + CRLF + "Data de Hoje: " + dToC(DATE()) + CRLF + "Data de Criação: 01/01/2010"})
    ElseIf EMPTY(cNome)
        lOK := .F.
        HELP(,, 'Descrição',, 'Nome da playlist não pode ser vazia',1,0,,,,,, {"Preencha o campo Descrição"})
    EndIf
Return lOK

Static Function validaP(oModelGrid)
    local lOK := .T.
    local lPremium := oModelGrid:GetModel():GetValue('ZA7MASTER', "ZA7_PREMIU")
    If oModelGrid:Length() > 5 .and. lPremium == .f.
        lOK := .F.
        HELP(,, 'Playlist',, 'A playlist não pode conter mais de 5 músicas',1,0,,,,,, {"Escolha apenas 5 músicas para a sua playlist!"})
    EndIf
Return lOK
//----------------------------------------------------------------------------------------

Static Function criaButtonSel(oPanel,oOtherObject)//Autor
    TButton():New( 01, 10, "Selecionar Todos",oPanel,{|| SelGrid(oOtherObject)}, 60,10,,,.F.,.T.,.F.,,.F.,,,.F. )
    TButton():New( 01, 80, "Copiar Autores da Musica",oPanel,{||CopiaMusicas(oOtherObject)}, 80,10,,,.F.,.T.,.F.,,.F.,,,.F. )
Return
 
Static Function criaBtn2(oPanel,oOtherObject)//Álbum
    TButton():New( 01, 10, "Selecionar Todos  ",oPanel,{|| SelGrid2(oOtherObject)}, 60,10,,,.F.,.T.,.F.,,.F.,,,.F. )
    TButton():New( 01, 80, "Copiar Músicas do Álbum",oPanel,{||CopiaAlbum(oOtherObject)}, 80,10,,,.F.,.T.,.F.,,.F.,,,.F. )
Return

//----------------------------------------------------------------------------------------
Static Function SelGrid(oOtherObject)
    Local oGrid := oOtherObject:GetModel():GetModel("ZA2DETAIL")
    Local nX
    Local lValue
    For nX:=1 to oGrid:Length()
        oGrid:GoLine(nX)
        If !oGrid:isDeleted()
            lValue := oGrid:GetValue("SELECT")
            oGrid:LoadValue("SELECT", !lValue)
        EndIf
    Next nX
    oGrid:GoLine(1)

    oOtherObject:oControl:Refresh('ZA2_VIEW')
Return
//----------------------------------------------------------------------------------------
Static Function SelGrid2(oOtherObject)
    Local oGrid := oOtherObject:GetModel():GetModel("ZA4DETAIL")
    Local nX
    Local lValue
    For nX:=1 to oGrid:Length()
        oGrid:GoLine(nX)
        If !oGrid:isDeleted()
            lValue := oGrid:GetValue("SELECT")
            oGrid:LoadValue("SELECT", !lValue)
        EndIf
    Next nX
    oGrid:GoLine(1)
    oOtherObject:oControl:Refresh('ZA4_VIEW')
Return
//----------------------------------------------------------------------------------------
Static Function AfterActivate(oModel)
    local cdescri
    Local aAreaZA2 := ZA2->(GetArea())
    Local aAreaZA4 := ZA4->(GetArea())
    Local cMyCode := oModel:GetValue("ZA2DETAIL", "ZA2_AUTOR")
    Local cMyCode4 := oModel:GetValue("ZA4DETAIL", "ZA4_ALBUM")    
    Local oGrid1 := oModel:GetModel("ZA2DETAIL")
    Local oGrid2 := oModel:GetModel("ZA4DETAIL")
    Local cMyFilial := xFilial("ZA2")
    local cMyFilial4 := xFilial("ZA4")
//AUTOR//----------------------------------------------------------------------------------------
        ZA2->(DBSetOrder(1))    
        If ZA2->(DBSeek(cMyFilial))
            While ZA2->(!EOF()) .AND. ZA2->ZA2_FILIAL == cMyFilial
                //Verifica se o grid tem aquela primeira linha em branco
                If !oGrid1:SeekLine({{"ZA2_AUTOR",ZA2->ZA2_AUTOR}})
                    If !oGrid1:IsEmpty()
                        //Adiciona uma linha no grid
                        oGrid1:AddLine()
                    EndIf
                    //Adiciona valores na linha, sem executar validacao e gatilho
                    If oModel:GetOperation() != 1
                        oGrid1:SetValue("ZA2_AUTOR", ZA2->ZA2_AUTOR)    
                    EndIf
                EndIf
                 
                ZA2->(DBSkip())
            EndDo
        EndIf
//ALBUM //----------------------------------------------------------------------------------------
        ZA4->(DBSetOrder(1))    
        If ZA4->(DBSeek(cMyFilial4))
            While ZA4->(!EOF()) .AND. ZA4->ZA4_FILIAL == cMyFilial4
                //Verifica se o grid tem aquela primeira linha em branco
                If !oGrid2:SeekLine({{"ZA4_ALBUM",ZA4->ZA4_ALBUM}})
                    If !oGrid2:IsEmpty()
                        //Adiciona uma linha no grid
                        oGrid2:AddLine()
                    EndIf
                    //Adiciona valores na linha, sem executar validacao e gatilho
                    If oModel:GetOperation() != 1
                        cdescri := POSICIONE("ZA3", 1, xFilial("ZA3") + ZA4->ZA4_ALBUM, "ZA3_DESCRI")
                        oGrid2:SetValue("DESCRI",cdescri)
                        oGrid2:SetValue("ZA4_ALBUM", ZA4->ZA4_ALBUM)
                        oGrid2:SetValue("ZA4_MUSICA", ZA4->ZA4_MUSICA)     
                    EndIf
                EndIf
                 
                ZA4->(DBSkip())
            EndDo
        EndIf

    RestArea(aAreaZA2)
    RestArea(aAreaZA4)

Return

//----------------------------------------------------------------------------------------
Static Function CopiaMusicas(oOtherObject)
    Local oGrid := oOtherObject:GetModel():GetModel("ZA2DETAIL")
    Local nX
    Local lSelected
    Local oGridMusicas := oOtherObject:GetModel():GetModel("ZA8DETAIL")
    Local nLine := oGridMusicas:GetLine()

    For nX:=1 to oGrid:Length()
        If !oGrid:isDeleted(nX)
            lSelected := oGrid:GetValue("SELECT", nX)
            If lSelected
                insMusica(oGrid:GetValue("ZA2_AUTOR", nX), oGridMusicas)
            EndIf
        EndIf
    Next nX

    oGridMusicas:GoLine(nLine)
    oOtherObject:oControl:Refresh('ZA2_VIEW')
Return
//----------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------
Static Function insMusica(cCodAutor,oGridMusicas)
Local aAreaZA2 := ZA2->(GetArea())

    ZA2->(DBSetOrder(2)) //ZA2_FILIAL+ZA2_MUSICA
    If ZA2->(DBSeek(xFilial("ZA2")+cCodAutor))                 
        While ZA2->(!EOF()) .AND. ZA2->ZA2_FILIAL == xFilial("ZA2") .AND.  ZA2->ZA2_AUTOR == cCodAutor
            If !oGridMusicas:IsEmpty()
                oGridMusicas:AddLine()
            EndIf
            oGridMusicas:SetValue("ZA8_MUSICA", ZA2->ZA2_MUSICA)

            ZA2->(DBSkip())
        EndDo 
    EndIf

RestArea(aAreaZA2)
Return
//-----------------------------------------------------------------------------------------------

Static Function CopiaAlbum(oOtherObject)

    Local oGrid := oOtherObject:GetModel():GetModel("ZA4DETAIL")
    Local nX
    Local lSelected
    Local oGridAlbum := oOtherObject:GetModel():GetModel("ZA8DETAIL")
    Local nLine := oGridAlbum:GetLine()

    For nX:=1 to oGrid:Length()
        If !oGrid:isDeleted(nX)
            lSelected := oGrid:GetValue("SELECT",nX)
            If lSelected
                insAlbum(oGrid:GetValue("ZA4_ALBUM",nX), oGridAlbum)
            EndIf
        EndIf
    Next nX

    oGridAlbum:GoLine(nLine)
    oOtherObject:oControl:Refresh('ZA4_VIEW')
Return
//----------------------------------------------------------------------------------------
Static Function insAlbum(cCodAlbum,oGridAlbum)
Local aAreaZA4 := ZA4->(GetArea())

    ZA2->(DBSetOrder(1)) //ZA2_FILIAL+ZA2_MUSICA
    If ZA4->(DBSeek(xFilial("ZA2")+cCodAlbum))                 
        While ZA4->(!EOF()) .AND. ZA4->ZA4_FILIAL == xFilial("ZA4") .AND.  ZA4->ZA4_ALBUM == cCodAlbum
            If !oGridAlbum:IsEmpty()
                oGridAlbum:AddLine()
            EndIf
            oGridAlbum:SetValue("ZA8_MUSICA",ZA4->ZA4_MUSICA)
            ZA4->(DBSkip())
        EndDo 
    EndIf

RestArea(aAreaZA4)
Return

