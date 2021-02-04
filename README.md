# 4pilaresAdvisor
Um Indicador para auxiliar quem opera baseado nos 4 Pilares do Willy sem Stop Loss.

Funcionalidades:

* Mostra os Lotes em uso no momento;
* Mostra os Lotes Proporcionais ao Saldo Disponível. Lote de 0.01 para cada 100 dólares de saldo;
* Mostra no número de Operações que estão abertas no Par visualizado no gráfico;
* Mostra o total de Lotes que estão abertos no Par visualizado no gráfico;
* Mostra quantos pontos aquele Par está distante da Mediana, se Abaixo ou Acima dela;
* Mostra o Swap de Compra ou de Venda daquele Par no momento;
* Mostra o Spread atual daquele par no momento;
* Sugestão de AÇÃO baseado em Topo e Fundo histórico dos últimos 60 meses (5 anos) a partir da data atual automaticamente;
  - A ação pode ser COMPRAR, VENDER ou NEUTRO
  - A ação AGUARDAR é quando o Par fica abaixo ou acima da Mediana de 1000.
* Utiliza cores para facilitar o entendimento. Exemplo:
  - Swap negativo é na cor vermelha.
  - Swap positivo é na cor azul.
  - Spread Abaixo de 30 pontos é verde.
  - Spread Acima de 30 pontos e abaixo de 50 é azul.
  - Spread Acima de 50 pontos é vermelho.
  - Ultrapassar os lotes disponíveis fica vermelho a informação.
* Linhas de Topo e Fundo Histórico agora estão desenhadas no gráfico.

*Novidades:

* Configurações:
  - Poder escolher o histórico se 3, 5, 6, 8 ou 10 anos.
  - Escolher quantos pontos distante da Mediana o usuário quer receber sugestão.
* Personalização Visual:
  - Usuário poder redimensionar o tamanho do Display.
  - Escolher o canto para o Indicador ficar, se canto esquerdo superior ou canto direito superior.
* Movimentação daquele Par no dia de HOJE.
* Alerta de Lucro. O usuário pode escolher receber alerta quando suas ordens tiverem positivas a partir de um valor, por ex. 5 dólares. E pode definir também qual o intervalo de tempo será notificado.
* Botão de Esconder o Indicador.
  


TO DO:

* Mostrar o Nivel de Margem no Painel.
* Sinal sonoro no cruzamento das médias móveis 6 e 21.
* Mostrar a diversificação dos pares operados no momento.
* Limpar o gráfico ao retirar o indicador.
* Quantos pontos aquele PAR movimenta em média por dia.
* Painel de personalização do usuário
  - Personalização de dados a serem apresentados.

* Mostrar Todos Ativos que são pra VENDA e todos que são pra COMPRA.
  - Opção de clicar no ativo e ir diretamente pro gráfico dele.

* Melhoria das Labels nas linhas de topo, mediana e fundo.
* Resolver problema de quem utiliza escala maior nas fontes do Windows. Por ex: 125%
