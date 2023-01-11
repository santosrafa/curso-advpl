#INCLUDE 'protheus.ch'
#INCLUDE 'parmtype.ch'

user function BANCO002()
    Local aArea := SB1->(GetArea())
    Local cMsg  := ''

    DbSelectArea("SB1")                           /* Acessando a tabela SB1 */
    SB1->(DbSetOrder(1))                          /* Acessando o indice 1 da tabela */
    SB1->(DBGOTOP())

    cMsg := Posicione( 'SB1',; 
                        1,;
                        FWXFilial('SB1')+ '000002',;               //FWXFilial: Filial corrente
                        'B1_DESC')
    
    Alert("Descrição do Produto: " +cMsg, "AVISO")

    RestArea(aArea)
return
