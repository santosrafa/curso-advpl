#INCLUDE 'protheus.ch'
#INCLUDE 'parmtype.ch'


User Function ESTRUTUR()

    Local nNum1 := 22
    Local nNum2 := 100
    
    if (nNum1 = nNum2)
        MsgInfo("A variavel nNum1 � igual a nNum2")
    
    elseif (nNum1 > nNum2)
        MsgAlert("A variavel nNum1 � maior que a nNum2")
    
    elseif (nNum1 != nNum2)
        MsgAlert("A variavel nNum1 � diferente da nNum2")        
        
    endif

Return
