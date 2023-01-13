#INCLUDE 'protheus.ch'
#INCLUDE 'parmtype.ch'

/* RecLock: Utilizado para fazer altera��o no campo da tabela */

user function BANCO004()

    Local aArea := SB1->(GetArea())

    DbSelectArea('SB1')
    SB1->(DbSetOrder(1))
    SB1->(DBGOTOP())

    /* Iniciar transa��o */

    Begin Transaction

        MsgInfo("A descri��o do produto ser� alterada!", "Aten��o")

        if SB1->(DbSeek(FWxFilial('SB1') + '000002'))
            RecLock('SB1', .F.)                                                 //Trava registro para alteracao
            Replace B1_DESC With "Monitor dell 42pl"
            SB1->(MsUnlock())
        endif

    end Transaction

    RestArea (aArea)
return
