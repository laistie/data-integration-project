# data-integration-project

Repositório destinado ao trabalho da disciplina de Banco de Dados II, ofertada no 6º semestre de Ciência da Computação. O objetivo do projeto é integrar dados levantados pelas surveys anuais do Stack Overflow no SGBD Oracle.

## Descrição do projeto

Com base nas surveys realizadas anualmente pelo Stack Overflow, procurou-se integrar dados relevantes para análise no Oracle. Foram utilizados conjuntos de dados referentes aos últimos dois anos (2023, 2022) e analisou-se os atributos de interesse comuns aos anos considerados.

Primeiro, foi criado um esquema normalizado contendo os atributos, no qual os dados foram carregados já padronizados. Em seguida, foram realizadas consultas que mostrassem análises relevantes envolvendo o esquema, a fim de se explorar os conceitos de procedures, joins, funções de agregação, condições de seleção etc. vistos em aula.

## Plano de execução das consultas

- obs: as consultas a seguir referem-se às apresentadas no arquivo 'queries.sql'.

### (1) Distribuição de usuários por idade e uso de livros e/ou mídia física como recurso de aprendizado

Essa consulta analisa a distribuição da survey de 2023, agrupando-os por idade e verificando quantos utilizam livros e/ou mídia física como recurso de aprendizado. Além disso, foram realizados dois cálculos:

- porcentagem de usuários, separados por faixa etária, que usam esse recurso em relação ao total de usuários que utilizam livros e/ou mídia física;
- porcentagem de usuários em cada faixa etária em relação ao total de usuários da pesquisa de 2023, independentemente do recurso utilizado.

Nesse sentido, o levantamento permitiu compreender a popularidade do recurso dentro da pesquisa como um todo, além de também elucidar quais faixas etárias têm maior presença entre os que utilizam livros e/ou mídia física para aprender.

### (2) Relação entre escolaridade e anos de experiência em programação

Buscou-se encontrar a idade média de anos programando, agrupando os usuários por escolaridade. A hipótese adotada foi que usuários com maior escolaridade tendem a ter mais anos de experiência em programação.

Para tanto, calculou-se a média dos anos de experiência em programação, agrupando os resultados pelo nível de escolaridade. Por fim, ordenou-se os resultados em ordem decrescente para destacar os níveis educacionais com mais experiência em programação.

### (3) Relação entre país de origem e a experiência em programação

Essa consulta traz a média de anos programando dos usuários e agrupa os resultados por país. Ao fim da análise, como inicialmente esperado, foi possível observar que países desenvolvidos tendem a ter usuários mais experientes em programação, enquanto países menos desenvolvidos apresentam médias menores.

### (4) Distribuição do grau de escolaridade por país

Buscou-se analisar a frequência de cada nível de escolaridade dentro de cada país, determinando quais são os três níveis mais comuns em cada um deles. Sendo assim, em países menos desenvolvidos, um bacharelado pode ser considerado um alto nível de escolaridade e, juntamente com a consulta (3), pode-se inferir que países com menor escolaridade média tendem a ter usuários com menos experiência em programação.
