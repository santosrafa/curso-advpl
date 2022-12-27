#INCLUDE 'protheus.ch'
#INCLUDE 'parmtype.ch'

/* Programa de atualização são telas customizadas para realizarmos inclusão/alteração de itens. */

USER FUNCTION MODELO1()
    Local cAlias  := "SB1"                               /* Aqui pegará uma tabela criada por você. */
    Local cTitulo := "Cadastro AXCadastro"
    Local cVldExc := .T.
    Local cVldAlt := .T.

    /* AXCadastro: Para cadastramento em tela cheia ex. cadastro de clientes. */
    AXCadastro(cAlias, cTitulo, cVldExc, cVldAlt)
RETURN NIL

/* So consegui executar esse codigo no modulo SIGAGFE em miscelania-executar programas */
