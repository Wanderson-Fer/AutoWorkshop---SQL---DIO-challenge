# AutoWorkshop - SQL - DIO Challenge

![GitHub repo size](https://img.shields.io/github/repo-size/Wanderson-Fer/AutoWorkshop---SQL---DIO-Challenge?style=for-the-badge)
![GitHub language count](https://img.shields.io/github/languages/count/Wanderson-Fer/AutoWorkshop---SQL---DIO-Challenge?style=for-the-badge)
![GitHub forks](https://img.shields.io/github/forks/Wanderson-Fer/AutoWorkshop---SQL---DIO-Challenge?style=for-the-badge)

## Proposta

### Parte 1 - Construir um Esquema Conceitual para Banco de Dados

A partir da narrativa fornecida você será capaz de criar todas as entidades, relacionamentos e atributos.

**Narrativa:**

- Sistema de controle e gerenciamento de execução de ordens de serviço em uma oficina mecânica
- Clientes levam veículos à oficina mecânica para serem consertados ou para passarem por revisões  periódicas
- Cada veículo é designado a uma equipe de mecânicos que identifica os serviços a serem executados e preenche uma OS com data de entrega.
- A partir da OS, calcula-se o valor de cada serviço, consultando-se uma tabela de referência de mão-de-obra
- O valor de cada peça também irá compor a OSO cliente autoriza a execução dos serviços
- A mesma equipe avalia e executa os serviços
- Os mecânicos possuem código, nome, endereço e especialidade
- Cada OS possui: n°, data de emissão, um valor, status e uma data para conclusão dos trabalhos.

### Parte 2 - Constrir um Projeto Lógico de Banco de Dados do Zero

Nesta etapa, você definirá desde o esquema até a implementação do banco de dados. Após a criação do **esquema lógico**, realize a criação do **Script SQL** para criação do esquema do banco de dados. Posteriormente, realize a persistência de dados para **realização de testes**. Especifique ainda **queries** mais complexas do que apresentadas durante a explicação do desafio. Sendo assim, crie queries SQL com as cláusulas abaixo:

- Recuperações simples com SELECT Statement;
- Filtros com WHERE Statement;
- Crie expressões para gerar atributos derivados;
- Defina ordenações dos dados com ORDER BY;
- Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados.

## Execução do Desafio

### Parte 1

#### Diagrama MER

Este modelo de entidade e relacionamento fornece uma visão geral dos dados e relacionamentos necessários para um **sistema de gerenciamento de serviços mecânicos**.

![Diagrama Entidade-Relacionamento](img/MER_AutoWorkshop.png)

As seguintes entidades são definidas no modelo: **Mecânico, Time de Mecânicos, Ordem de serviço, Serviço, Peça, Veículo, Cliente**

Relacionamentos:

* **Participa:** Um mecânico participa de um time, um time pode ter mais de um mecânico (N:1).
* **Realizam:** Um Time realiza uma ou mais Ordens de Serviço, cada ordem é realizada por um time (1:N).
* **Usado:** Uma ou mais peças são usadas em uma ou mais Ordens de Serviço (N:M).
* **Compõe:** Um ou mais serviços compõem uma ou mais Ordens de Serviço (N:M).
* **Pertence:** Um veículo pertence a um cliente, um cliente pode ter um ou mais veículos (N:1).
* **Participa:** Um veículo participa de uma ou mais Ordens de serviço (1:N).

### Parte 2

#### Diagrama EER

![Diagrama EER](img/EER_AutoWorkshop.png)

O diagrama EER acima mostra como cada entidade como tabela e também os relacinamentos N:M. Cada tabela tem seus atributos, que descrevem as informações relevantes, e estão tipados de acordo com a informação que será armazenada. 

Há ainda as chaves primárias, simples e compostas, além das chaves estrangeiras, no topo de cada tabela, indicando como a relação será 'vinculada' no esquema SQL, orientando assim a criação do Banco de Dados através de comando MySQL DDL.

## Perguntas abordadas nas [queries DML](autoworkshop_dml_queries.sql)

- Qual a quantidade de clientes?

    ![Contagem de clientes](img/ClientsCount.png)

- Quantos veículos cada cliente tem?

    ![Contagem de veículo por cliente](img/VehicleCountByClient.png)

- Quantas Ordens de Serviço foram pedidas por cada cliente?

    ![Contagem de ordem de serviços por clientes](img/OrderServiceCountByClient.png)

- Qual a quantidade de veículos registrados?

    ![Total de veículos](img/VehiclesTotal.png)

- Qual a cor de veículo mais usada?

    ![Contagem de cor por veículo](img/ColorCountByVehicle.png)

- Quantas Ordens de Serviço foram registradas para cada veículo?

    ![Contagem de ordem de serviços por veículo](img/OrderServiceCountByVehicle.png)

- Quantos mecânicos trabalham na oficina?

    ![Contagem de mecânicos](img/MechanicCount.png)

- Quantos mecânicos estão dispostos em cada time?

    ![Contagem de mecânicos por time](img/MechanicCountByMechanicTeam.png)

- Quantos mecânicos temos por especilidade?

    ![Contagem de mecânicos por especialidade](img/MechanicCountBySpecialty.png)

- Quantos serviços são oferecidos?

    ![Contagem de serviços](img/ServiceCount.png)

- Quais os serviços mais solicitados?

    ![Quantidade de serviços](img/ServiceQuantity.png)

- Qual a receita obtida com cada serviço?

    ![Valor total arrecadado com cada serviço](img/ServiceAmount.png)

- Quais as peças mais usadas?

    ![Quantidade de peças](img/PartQuantity.png)

- Qual a receita obitida com cada peça?

    ![Valor total arrecadado com cada peça](img/PartAmount.png)

- Qual a quantidade de Ordens de serviço por Status?

    ![Contagem de ordem de serviços por status](img/OrderCountByStatus.png)

- Quantas Ordens de Serviço 'Em Progresso' estão atribuídas a cada time?

    ![Contagem de ordens de serviços por time](img/OrderServiceCountByMechanicTeam.png)

- Quanta receita cada Ordem de Serviço 'Concluída' gerou com peças?

    ![Valor total com serviços em ordens concluídas](img/AmountByPartWhenOrderDone.png)

- Quanta receita cada Ordem de Serviço 'Concluída' gerou com serviços?

    ![Valor total com peças em ordens concluídas](img/AmountByServiceWhenOrderDone.png)

## Author

### Wanderson G. Fernandes
- [Instagram](https://instagram.com/locke._.wanderson?igshid=ZDc4ODBmNjlmNQ==)
- [LinkedIn](https://www.linkedin.com/in/wanderson-guedes-3138851aa)

## 📝 Licença

Esse projeto está sob licença MIT. Veja o arquivo [LICENÇA](LICENSE.md) para mais detalhes.
