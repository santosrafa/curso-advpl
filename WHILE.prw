#INCLUDE 'protheus.ch'
#INCLUDE 'parmtype.ch'

user function WHILE()

    Local nNum1 := 0
    Local nNum2 := 10

    WHILE nNum1 < nNum2
        nNum1++
    ENDDO
        Alert(nNum1 + nNum2)

return
