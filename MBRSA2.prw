#INCLUDE 'protheus.ch'
#INCLUDE 'parmtype.ch'

/* FilBrowse: Permite a utilização de filtros na mBrowse */

user function MBRSA2()

    Local   cAlias       := "SA2"
    Local   aCores       := {}
    Local   cFiltra      := "A2_FILIAL == '"+xFilial('SA2')+"' .AND. A2_EST == 'SP'"
    Private cCadastro    := "Cadastro MBEOWSE"
    Private aRtoina      := {}
    Private aIndexSA2    := {}
    Private bFiltraBrw   := {|| FilBrowse(cAlias, @aIndexSA2, @cFiltra)} //FilBrowse

    AADD(aRotina, {"Pesquisar"    ,"AxPesqui"     ,0,1})        /* AxPesqui: São funcoes padroes da totvs neste caso de Pesquisar */
    AADD(aRotina, {"Visualizar"   ,"AxVisual"     ,0,2})
    AADD(aRotina, {"Incluir"      ,"U_BInclui"    ,0,3})        /* Operacao 3: Incluir */
    AADD(aRotina, {"Trocar"       ,"U_BAltera"    ,0,4})
    AADD(aRotina, {"Excluir"      ,"U_BDeleta"    ,0,5})
    AADD(aRotina, {"Legenda"      ,"U_BLegenda"   ,0,6})

    DbSelectArea(cAlias)                                        /* Para saber qual tabela ele irá trabalhar */
    DbSetOrder(1)                                               /* Passando index 1 */

    EVAL(bFiltraBrw)

    DBGOTOP()                                                   /* Para ficar no top da tabelas */
    mBrowse(6,1,22,75,cAlias)

    EndFilBrw(cAlias,aIndexSA2)                                 /* Finalizando o filbrowse */

return
/* Função BInclui - Inclusão */
user function BInclui(cAlias,nReg,nOpc)
    Local nOpcao := 0
    nOpcao := AxInclui(cAlias,nReg,nOpc)
        if nOpcap == 1
            MsgInfo("Inclusão efetuada com sucesso!")
        else
            MsgAlert("Inclusão Cancelada!")
        end if
return
/* Função BAltera - Alteração */
user function BAltera(cAlias,nReg,nOpc)
    Local nOpcao := 0
    nOpcao := AxAltera(cAlias,nReg,nOpc)
        if nOpcap == 1
            MsgInfo("Alteração efetuada com sucesso!")
        else
            MsgAlert("Alteração Cancelada!")
        end if
return nil
/* Função BDeleta - Deleção */
user function BDeleta(cAlias,nReg,nOpc)
    Local nOpcao := 0
    nOpcao := AxDeleta(cAlias,nReg,nOpc)
        if nOpcap == 1
            MsgInfo("Exclusão Cancelada!")
        else
            MsgAlert("Exclusão efetuada com sucesso!")
        end if
return nil
