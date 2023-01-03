#INCLUDE 'protheus.ch'
#INCLUDE 'parmtype.ch'

/* Utilizando bloco de codigo */

user function BLOCO()

     // Local bBloco := {|| Alert("Ola Mundo!")}
    //eval (bBloco)                                           /* Para executar o bloco de codigo */

    Local bBloco := {|cMsg| Alert(cMsg)}
    eval(bBloco, "Ola Mundo!!!")

return
