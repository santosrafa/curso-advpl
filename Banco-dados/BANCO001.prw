#INCLUDE 'protheus.ch'
#INCLUDE  'parmtype.ch'

USER FUNCTION BANCO001()

    Local aArea := SB1->(GetArea())                               /* -> Faz referencia em agluma coisa no advpl */
                                                                  /* (GetArea()): Pega a area de referencia que no caso é a SB1 */

    DbSelectArea("SB1")                                           /* DbSelectArea("SB1"): Abrir a tabela sb1 */
    SB1-> (DbSetOrder(1))                                         /* Posiciona no indice 1. */
    SB1-> (DBGOTOP())

    if SB1->(dbSeek(FWXFilial("SB1") + "000002"))
        Alert (SB1->B1_DESC)
    endif

    RestArea(aArea)                                             /*  RestArea(aArea): Saindo da tabela */

RETURN
