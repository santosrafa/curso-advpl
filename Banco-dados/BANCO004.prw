#INCLUDE 'protheus.ch'
#INCLUDE 'parmtype.ch'

user function BANCO004()

    Local aArea := SB1->(GetArea())

    DbSelectArea('SB1')
    SB1->(DbSetOrder(1))
    SB1->(DBGOTOP())

    /* Iniciar transação */

    Begin Transaction

        MsgInfo("A descrição do produto será alterada!", "Atenção")

        if SB1->(DbSeek(FWxFilial('SB1') + '000002'))
            RecLock('SB1', .F.)                                                 //Trava registro para alteracao
            Replace B1_DESC With "Monitor dell 42pl"
            SB1->(MsUnlock())
        endif

    end Transaction

    RestArea (aArea)
return
