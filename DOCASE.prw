#INCLUDE 'protheus.ch'
#INCLUDE 'parmtype.ch'

/* Utilizando estrutura de repeticao DoCase */

user function DOCASE()

    Local cData := "25/12/2023"

    Do Case

        Case cData == "20/12/2017"
        Alert ("Não é Natal!" + cData)

        Case cData == "25/12/2023"
        Alert ("É Natal!!")

        OtherWise                                               /* Caso os cases sejam falsos */
        MsgAlert("Não sei qual é o dia de hoje!")
    End Case

return
