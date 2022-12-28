#INCLUDE 'protheus.ch'
#INCLUDE 'parmtype.ch'

USER FUNCTION AVETOR2()

/*      AADD():     PERMITE A INSERCAO DE UM ITEM EM ARRAY JA EXISTENTE.
        AINS():     PERMITE A INSERCÃO DE UMA ELEMENTO EM QUALQUER POSICAO DO ARRAY.
        ACLONE():   REALIZA A COPIA DE UM ARRAY PARA OUTRO.
        ADEL():     PERMITE A EXCLUSAO DE UM ELEMENTO DO ARRAY, TORNANDO O ULTIMO VALOR NULO.
        ASIZE():    REDEFINE A ESTRUTURA DO ARRAY, ADICIONANDO OU REMOVEND. DIFERENTE DO ADEL QUE DEIXA NULO AQUI ELE DIMINUI A ESTRUTRA DO VETOR.
        LEN():      RETORNA A QUANTIDADE DE ELEMENTOS DE UM ARRAY. */

    Local aVetor := {10,20,30}

        /* AADD()
        Aadd(aVetor, 40)
        Alert(LEN(aVetor)) */

        /* AINS(): ELE ELIMINA A POSICAO DO ARRAY E INCLUI A QUE QUEREMOS
        AINS(aVetor, 2)
        aVetor[2] := 200
        Alert (aVetor[2])
        Alert (LEN(aVetor)) */

        /* ACLONE()
        aVetor2 := ACLONE(aVetor)
            for nCount := 1 to Len(aVetor2)
                Alert (aVetor2[nCount])
                
            next nCount */

        /* ADEL()
        ADEL  (aVetor, 2)
        Alert (aVetor[3])
        Alert (LEN(aVetor)) */

        ASIZE( aVetor, 2 )
        Alert (LEN(aVetor))
        FOR nCount := 1 TO LEN (aVetor)
            Alert (aVetor[nCount])
        NEXT nCount  

RETURN NIL
