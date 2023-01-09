#INCLUDE 'protheus.ch'
#INCLUDE 'parmtype.ch'

/* FilBrowse: Permite a utiliza��o de filtros na mBrowse */

user function MBRSA2()

    Local   cAlias       := "SA2"
    Local   aCores       := {}
    Local   cFiltra      := "A2_FILIAL == '"+xFilial('SA2')+"' .AND. A2_EST == 'SP'"
    Private cCadastro    := "Cadastro MBEOWSE"
    Private aRtoina      := {}
    Private aIndexSA2    := {}
    Private bFiltraBrw   := {|| FilBrowse(cAlias, @aIndexSA2, @cFiltra)} //FilBrowse

    AADD(aRotina, {"Pesquisar"    ,"AxPesqui"     ,0,1})        /* AxPesqui: S�o funcoes padroes da totvs neste caso de Pesquisar */
    AADD(aRotina, {"Visualizar"   ,"AxVisual"     ,0,2})
    AADD(aRotina, {"Incluir"      ,"U_BInclui"    ,0,3})        /* Operacao 3: Incluir */
    AADD(aRotina, {"Trocar"       ,"U_BAltera"    ,0,4})
    AADD(aRotina, {"Excluir"      ,"U_BDeleta"    ,0,5})
    AADD(aRotina, {"Legenda"      ,"U_BLegenda"   ,0,6})

    DbSelectArea(cAlias)                                        /* Para saber qual tabela ele ir� trabalhar */
    DbSetOrder(1)                                               /* Passando index 1 */

    EVAL(bFiltraBrw)

    DBGOTOP()                                                   /* Para ficar no top da tabelas */
    mBrowse(6,1,22,75,cAlias)

    EndFilBrw(cAlias,aIndexSA2)                                 /* Finalizando o filbrowse */

return
/* Fun��o BInclui - Inclus�o */
user function BInclui(cAlias,nReg,nOpc)
    Local nOpcao := 0
    nOpcao := AxInclui(cAlias,nReg,nOpc)
        if nOpcap == 1
            MsgInfo("Inclus�o efetuada com sucesso!")
        else
            MsgAlert("Inclus�o Cancelada!")
        end if
return
/* Fun��o BAltera - Altera��o */
user function BAltera(cAlias,nReg,nOpc)
    Local nOpcao := 0
    nOpcao := AxAltera(cAlias,nReg,nOpc)
        if nOpcap == 1
            MsgInfo("Altera��o efetuada com sucesso!")
        else
            MsgAlert("Altera��o Cancelada!")
        end if
return nil
/* Fun��o BDeleta - Dele��o */
user function BDeleta(cAlias,nReg,nOpc)
    Local nOpcao := 0
    nOpcao := AxDeleta(cAlias,nReg,nOpc)
        if nOpcap == 1
            MsgInfo("Exclus�o Cancelada!")
        else
            MsgAlert("Exclus�o efetuada com sucesso!")
        end if
return nil
