#INCLUDE 'protheus.ch'
#INCLUDE 'parmtype.ch'

/* O cliente solicita desenvolvimento de uma tratativa no sistema ERP, onde nao pode ser permitido
que o usuario inclua produtos do tipo "PA" com conta contabil "001". */

/* A010TOK: Validação para inclusão ou alteração do Produto. */

User Function A010TOK()

    Local  lExecuta := .T.
    Local  cTipo := AllTrim(M->B1_TIPO)            /* AllTrim: Ela limpa espaços em branco em uma string. */  
    Local  cConta := AllTrim(M->B1_CONTA)           /* M-> Significa o que estiver na memoria */

    if (cTipo = "PA" .AND. cConta = "111010004")
        Alert ("A conta <b>" + cConta + "</b> não pode estar"+;
         "associada a um produto do tipo <b>" + cTipo)
        
        lExecuta := .F. 
    endif

return(lExecuta)
