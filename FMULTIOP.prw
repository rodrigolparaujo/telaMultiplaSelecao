//U_FMULTIOP('05')

User Function FMULTIOP(cTabela,cTitulo,l1Elem,lTipoRet)
	//Exemplo extraído da função GPEXFUNW, mas com pequenas modificações
	
	Local MvPar
	Local MvParDef:=""	
	Private aCat:={}
	
	Default cTitulo:=""		//O titulo não é obrigatório pois pode ser pegar o titulo da tabela SX5
	Default lTipoRet := .T.
	
	If(Empty(cTabela))
		MsgStop("Informe a tabela a ser pesquisada na SX5!"+CRLF+CRLF+"Avise ao Administrador do sistema. Função: FMULTIOP()","ERRO")
		Return
	Endif
	
	l1Elem := If (l1Elem = Nil , .F. , .T.)
	
	cAlias := Alias() // Salva Alias Anterior
	
	IF lTipoRet
		MvPar:=&(Alltrim(ReadVar()))	// Carrega Nome da Variavel do Get em Questao
		mvRet:=Alltrim(ReadVar())		// Iguala Nome da Variavel ao Nome variavel de Retorno
	EndIF
	
	dbSelectArea("SX5")
	
	If dbSeek(xFilial("SX5")+"00"+cTabela)
	   cTitulo := Alltrim(Left(X5Descri(),20))
	Endif
	
	If dbSeek(xFilial("SX5")+cTabela)
		CursorWait()
			aCat := {}
			While SX5->(!Eof()) .AND. SX5->X5_FILIAL == XFilial("SX5") .AND. SX5->X5_Tabela == cTabela
				Aadd(aCat,Left(SX5->X5_Chave,1) + " - " + Alltrim(X5Descri()))
				MvParDef+=Left(SX5->X5_Chave,1)
				dbSkip()
			Enddo
		CursorArrow()
	Else
		Help('',1,'FMULTIOP',,'As opções não foram inseridas!',1,0)
	Endif
	
	IF lTipoRet

		IF f_Opcoes(@MvPar,cTitulo,aCat,MvParDef,12,49,l1Elem)  // Chama funcao f_Opcoes (padrão Protheus)
			&MvRet := mvpar										 // Devolve Resultado
		EndIF
	EndIF
	
	dbSelectArea(cAlias) // Retorna Alias	
Return( IF( lTipoRet , .T. , MvParDef ) )


/*
Sintaxe da função f_Opcoes()
Function f_Opcoes(	uVarRet			,;	//Variavel de Retorno
			cTitulo			,;	//Titulo da Coluna com as opcoes
			aOpcoes			,;	//Opcoes de Escolha (Array de Opcoes)
			cOpcoes			,;	//String de Opcoes para Retorno
			nLin1			,;	//Nao Utilizado
			nCol1			,;	//Nao Utilizado
			l1Elem			,;	//Se a Selecao sera de apenas 1 Elemento por vez
			nTam			,;	//Tamanho da Chave
			nElemRet		,;	//No maximo de elementos na variavel de retorno
			lMultSelect		,;	//Inclui Botoes para Selecao de Multiplos Itens
			lComboBox		,;	//Se as opcoes serao montadas a partir de ComboBox de Campo ( X3_CBOX )
			cCampo			,;	//Qual o Campo para a Montagem do aOpcoes
			lNotOrdena		,;	//Nao Permite a Ordenacao
			lNotPesq		,;	//Nao Permite a Pesquisa	
			lForceRetArr		,;	//Forca o Retorno Como Array
			cF3			 ;	//Consulta F3	
		  )

*/
