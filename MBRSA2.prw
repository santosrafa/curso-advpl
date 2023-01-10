#INCLUDE 'protheus.ch'
#INCLUDE 'parmtype.ch'

/* FilBrowse: Permite a utiliza��o de filtros na mBrowse */

user function MBRSA2()

    Local   cAlias       := "SA2"
    Local   aCores       := {}
    Local   cFiltra      := "A2_FILIAL == '"+xFilial('SA2')+"' .AND. A2_EST == 'SP'"
    Private cCadastro    := "Cadastro MBEOWSE"
    Private aRotina      := {}
    Private aIndexSA2    := {}
    Private bFiltraBrw   := {|| FilBrowse(cAlias, @aIndexSA2, @cFiltra)} //FilBrowse

    AADD(aRotina, {"Pesquisar"    ,"AxPesqui"     ,0,1})        /* AxPesqui: S�o funcoes padroes da totvs neste caso de Pesquisar */
    AADD(aRotina, {"Visualizar"   ,"AxVisual"     ,0,2})
    AADD(aRotina, {"Incluir"      ,"U_BInclui"    ,0,3})        /* Operacao 3: Incluir */
    AADD(aRotina, {"Trocar"       ,"U_BAltera"    ,0,4})
    AADD(aRotina, {"Excluir"      ,"U_BDeleta"    ,0,5})
    AADD(aRotina, {"Legenda"      ,"U_BLegenda"   ,0,6})

    /* Acores - Legenda */
    aadd (aCores,{"A2_TIPO =='F'", "BR_VERDE"})
    aadd (aCores,{"A2_TIPO =='J'", "BR_AMARELO"})
    aadd (aCores,{"A2_TIPO =='X'", "BR_LARANJA"})
    aadd (aCores,{"A2_TIPO =='F'", "BR_MARROM"})
    aadd (aCores,{"Empty(A2_TIPO)", "BR_VERDE"})

    DbSelectArea(cAlias)                                        /* Para saber qual tabela ele ir� trabalhar */
    DbSetOrder(1)                                               /* Passando index 1 */

    EVAL(bFiltraBrw)

    DBGOTOP()                                                   /* Para ficar no top da tabelas */
    mBrowse(6,1,22,75,cAlias,,,,,,aCores)

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

/* Fun��o BLegenda - Legendas */
user function BLegenda()
    Local aLegenda := {}

    aadd(aLegenda,{"BR_VERDE", "Pessoa Fisica"})
    aadd(aLegenda,{"BR_AMARELO", "Pessoa Juridica"})
    aadd(aLegenda,{"BR_LARANJA", "Exporta��o"})
    aadd(aLegenda,{"BR_MARROM", "Fornecedor Rural"})
    aadd(aLegenda,{"BR_PRETO", "N�o Classificado"})

    BrwLegenda(cCadastro, "Legenda", aLegenda)
return
