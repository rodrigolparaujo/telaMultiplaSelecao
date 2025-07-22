<a href="https://server.nitrado.net/toplist/view/17500552"><img src="https://server.nitrado.net/banner/big/17500552/2" /></a>

## Criando um janela de multiplas opções para retornar o resultado em um campo
<p><img src="/resources/multtela005.png"></p>

Vemos isso normalmente nos módulos de Recursos Humanos, a seleção de multiplas opções onde o resultado das seleções vão para um campo.

Abaixo irei mostrar como usar em uma consulta padrão de um campo e o conteúdo que irá aparecer na janela de seleção trazendo as opções de uma tabela SX5 ou de um array.

No Configurador, vá em Consulta Padrão,

Selecione o tipo de consulta específica, de um nome para a sua consulta e clique em Avançar.

<p><img src="/resources/multtela001.png"></p>

Para o exemplo em questão, na próxima tela, selecione a tabela SX5, em expressão chame a função que iremos criar e neste caso é a FMULTIOP, como parâmetro iremos colocar no nome da tabela YL – Código EDI. Poderia ser qualquer outra tabela, em retorno, teremos que dar um nome, mas para a nossa consulta não será necessário, mas como é um campo obrigatório coloque uma variavel qualquer e clique em Finalizar.

<p><img src="/resources/multtela002.png"></p>

Abra a tabela SXB no APSDU e remova a variável do retorno, localize o campo XB_TIPO = 5, vá no campo XB_CONTEM  e remova o conteúdo.

<p><img src="/resources/multtela003.png"></p>

No Configurador ou APSDU, vá no campo que desejar e informe o nome de sua consulta padrão.

<p><img src="/resources/multtela004.png"></p>

Nota: A quantidade de registros selecionados dependerá do tamanho do campo que irá receber, então se o campo é de tamanho 6, apenas 6 registros serão selecionados.
Para, retornar apenas um registro, informe no parâmetro l1Elem como verdadeiro (.T.)

<a href="https://server.nitrado.net/toplist/view/17383816"><img src="https://server.nitrado.net/banner/big/17383816/6" /></a>
