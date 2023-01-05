#INCLUDE 'protheus.ch'
#INCLUDE 'parmtype.ch'

/* Utilizando estrutura de repeticao DoCase */

user function DOCASE()

    Local cData := "25/12/2023"

    Do Case

        Case cData == "20/12/2017"
        Alert ("N�o � Natal!" + cData)

        Case cData == "25/12/2023"
        Alert ("� Natal!!")

        OtherWise                                               /* Caso os cases sejam falsos */
        MsgAlert("N�o sei qual � o dia de hoje!")
    End Case

return
