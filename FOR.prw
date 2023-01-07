#INCLUDE 'protheus.ch'
#INCLUDE 'parmtype.ch'

/* Estrutura de Repeticao For */

User Function FOR()

    Local nCount
    Local nNum := 0

    For nCount := 0 to 10

        nNum += nCount

        Next
        Alert ("Valor: " + CValToChar(nNum))

Return
