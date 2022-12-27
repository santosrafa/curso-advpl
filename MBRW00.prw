#INCLUDE 'protheus.ch'
#INCLUDE 'parmtype.ch'

/* MBrowse: É uma funcionalidade de cadastro que permite a utilizacao de recursos mais aprimorados
na visualizacao e manipulacao das informacoes. */

/* Recursos adicionais: Como status de registros, legendas e filtros para as informacoes */

USER FUNCTION MBRW00()
    Local cAlias    := "SB1"
    Private cCadastro := "Cadastro Produtos MBrowse"
    Private aRotina := {}

    AADD(aRotina, {"Pesquisar"    ,"AxPesqui"   ,0,1})        /* AxPesqui: São funcoes padroes da totvs neste caso de Pesquisar */
    AADD(aRotina, {"Visualizar"   ,"AxVisual"   ,0,2})
    AADD(aRotina, {"Incluir"      ,"AxInclui"   ,0,3})        /* Operacao 3: Incluir */
    AADD(aRotina, {"Trocar"       ,"AxAltera"   ,0,4})
    AADD(aRotina, {"Excluir"      ,"AxDeleta"   ,0,5})
    AADD(aRotina, {"OlaMundo"   ,"U_OLAMUNDO"   ,0,6})        /* Operacao 6: Outras açoes */

    DbSelectArea(cAlias)
    DbSetOrder(1)                                             /* Indice */
    MBrowse(,,,,cAlias)

RETURN NIL
