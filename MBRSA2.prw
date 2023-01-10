#INCLUDE 'protheus.ch'
#INCLUDE 'parmtype.ch'

/* FilBrowse: Permite a utilização de filtros na mBrowse */

user function MBRSA2()

    Local   cAlias       := "SA2"
    Local   aCores       := {}
    Local   cFiltra      := "A2_FILIAL == '"+xFilial('SA2')+"' .AND. A2_EST == 'SP'"
    Private cCadastro    := "Cadastro MBEOWSE"
    Private aRotina      := {}
    Private aIndexSA2    := {}
    Private bFiltraBrw   := {|| FilBrowse(cAlias, @aIndexSA2, @cFiltra)} //FilBrowse

    AADD(aRotina, {"Pesquisar"    ,"AxPesqui"     ,0,1})        /* AxPesqui: São funcoes padroes da totvs neste caso de Pesquisar */
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

    DbSelectArea(cAlias)                                        /* Para saber qual tabela ele irá trabalhar */
    DbSetOrder(1)                                               /* Passando index 1 */

    EVAL(bFiltraBrw)

    DBGOTOP()                                                   /* Para ficar no top da tabelas */
    mBrowse(6,1,22,75,cAlias,,,,,,aCores)

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

/* Função BLegenda - Legendas */
user function BLegenda()
    Local aLegenda := {}

    aadd(aLegenda,{"BR_VERDE", "Pessoa Fisica"})
    aadd(aLegenda,{"BR_AMARELO", "Pessoa Juridica"})
    aadd(aLegenda,{"BR_LARANJA", "Exportação"})
    aadd(aLegenda,{"BR_MARROM", "Fornecedor Rural"})
    aadd(aLegenda,{"BR_PRETO", "Não Classificado"})

    BrwLegenda(cCadastro, "Legenda", aLegenda)
return
