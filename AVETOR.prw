#INCLUDE 'protheus.ch'
#INCLUDE 'parmtype.ch'

/* Arrays: São colecao de valores similares a uma lista */

User function AVETOR()

    Local  dData := Date()
    Local aValores := {"Joao", dData, 100}

    Alert (aValores[2])                 /* Exibe possicao dois do array */
    Alert (aValores[3])

RETURN
