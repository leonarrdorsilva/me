#include 'protheus.ch'
user function projeto2()
local oBrowse := FWMBrowse():New() //Criar browse

oBrowse:SetAlias('ZA1')
oBrowse:SetMenuDef('projeto2') //nome da fonte

oBrowse:Activate() // ativar o browse

Return

Static Function Menudef()

Return FWMVCMenu('projeto2') //Menu padrão com C.R.U.D. //nome da fonte

Static function ModelDef() //sempre staticfunction
local oModel := MPFormModel():New('ZA1MODEL')
local oStruZA1 := FWFormStruct(1,'ZA1') //cria estrutura
local oStruZA2 := FWFormStruct(1,'ZA2') //cria estrutura

oModel:AddFields('ZA1MASTER',/*Owner*/ ,oStruZA1,/**/,) // adiciona
oModel:AddGrid('ZA2DETAIL', 'ZA1MASTER', oStruZA2, , )

oModel:SetRelation( 'ZA2DETAIL', { {'ZA2_FILIAL', "xFilial('ZA2')"},;
 {"ZA2_MUSICA" , "ZA1_MUSICA"} }, ZA2->( IndexKey( 1 ) ) )

oModel:GetModel('ZA1MASTER'):SetDescription('Dados da Musica')
oModel:GetModel('ZA2DETAIL'):SetDescription('Dados do Autor da Musica')

Return oModel

Static Function ViewDef() //sempre static function
local oView := FWFormView():New() //objeto da view
local oStruct := FWFormStruct(2,'ZA1')
local oStructZA2 := FWFormStruct(2,'ZA2')
oView:SetModel(ModelDef()) // linka a view com o model
oView:AddField('ZA1_VIEW', oStruct, 'ZA1MASTER')
oView:AddGrid('ZA2_VIEW', oStructZA2, 'ZA2DETAIL')

oView:AddIncrementField('ZA2_VIEW', 'ZA2_ITEM')

oView:CreateHorizontalBox('BOXZA1', 50)
oView:CreateHorizontalBox('BOXZA2', 25)

oView:SetOwnerView('ZA1_VIEW','BOXZA1') //colocar um componente no outro
oView:SetOwnerView('ZA2_VIEW','BOXZA2') //colocar um componente no outro
oView:EnableTitleView('ZA2_VIEW')

Return oView