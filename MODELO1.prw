#INCLUDE 'protheus.ch'
#INCLUDE 'parmtype.ch'

/* Programa de atualiza��o s�o telas customizadas para realizarmos inclus�o/altera��o de itens. */

USER FUNCTION MODELO1()
    Local cAlias  := "SB1"                               /* Aqui pegar� uma tabela criada por voc�. */
    Local cTitulo := "Cadastro AXCadastro"
    Local cVldExc := .T.
    Local cVldAlt := .T.

    /* AXCadastro: Para cadastramento em tela cheia ex. cadastro de clientes. */
    AXCadastro(cAlias, cTitulo, cVldExc, cVldAlt)
RETURN NIL

/* So consegui executar esse codigo no modulo SIGAGFE em miscelania-executar programas */
