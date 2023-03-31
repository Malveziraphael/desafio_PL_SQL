/*

--Tables

1 - Criar uma base de endereco para localizar os clientes e os funcionarios;

2 - Criar base dos clientes e dos funcionarios;

3 - Criar base das mercadorias(Preço de custo, Preço de venda, quantidade no estoque);

4 - Criar tabelas de compras de cliente;

--Selects

5 - Fazer uma junção de dados para compreensão;

6 - Fazer comparacao de qual cliente comprou mais;

7 - Qual funcionario vendeu mais;

8 - Fazer media de cliente em geral;

9 - A media de vendas e o total de vendas de um periodo;

*/

--1
SELECT * FROM mar_street;

--2
SELECT * FROM mar_client;
SELECT * FROM mar_employees;

--3
SELECT * FROM mar_merchandise;

--4
SELECT * FROM mar_sales;

--6
SELECT * FROM mar_sales_sum;

--7
SELECT * FROM mar_sales_employees_sum;

--8
SELECT * FROM mar_sales_client_avg;

--9
SELECT * FROM mar_sales_total;
SELECT * FROM mar_sales_avg;




--#1 Adress

CREATE SEQUENCE seq_mar_street START WITH 1 NOCACHE INCREMENT BY 1;

CREATE TABLE mar_street(
   id_mar_street_pk NUMBER DEFAULT seq_mar_street.NEXTVAL NOT NULL
  ,name VARCHAR2(255)
  ,distance NUMBER
  ,CONSTRAINT pk_id_mar_street PRIMARY KEY(id_mar_street_pk)
);

INSERT INTO mar_street(name, distance) VALUES('Borges da Silva', 10);
INSERT INTO mar_street(name, distance) VALUES('Faria de Barros', 17);
INSERT INTO mar_street(name, distance) VALUES('Pedro Mangos', 21);
INSERT INTO mar_street(name, distance) VALUES('Gomes Oliveira', 5);

SELECT * FROM mar_street;

--#2 Employees

CREATE SEQUENCE seq_mar_employees START WITH 1 NOCACHE INCREMENT BY 1;

CREATE TABLE mar_employees(
   id_mar_employees_pk NUMBER DEFAULT seq_mar_employees.NEXTVAL NOT NULL
  ,id_mar_street_fk NUMBER
  ,name VARCHAR2(255)
  ,salary NUMBER
  ,contract DATE
  ,CONSTRAINT pk_mar_employees PRIMARY KEY(id_mar_employees_pk)
);

ALTER TABLE mar_employees ADD CONSTRAINT fk_mar_street_employees FOREIGN KEY(id_mar_street_fk) REFERENCES mar_street(id_mar_street_pk);

INSERT INTO mar_employees(id_mar_street_fk, name, salary, contract) VALUES(2, 'Antonio Sabastiao', 1620, SYSDATE -210);
INSERT INTO mar_employees(id_mar_street_fk, name, salary, contract) VALUES(4, 'Lucas Rafael', 1320, SYSDATE -100);

SELECT * FROM mar_employees;

--#2 Clients

CREATE SEQUENCE seq_mar_client START WITH 1 NOCACHE INCREMENT BY 1;

CREATE TABLE mar_client(
   id_mar_client_pk NUMBER DEFAULT seq_mar_client.NEXTVAL NOT NULL
  ,id_mar_street_fk NUMBER
  ,name VARCHAR2(255)
  ,cpf NUMBER
  ,CONSTRAINT pk_id_mar_client PRIMARY KEY(id_mar_client_pk)
);

ALTER TABLE mar_client ADD CONSTRAINT fk_mar_street_client FOREIGN KEY(id_mar_street_fk) REFERENCES mar_street(id_mar_street_pk);

INSERT INTO mar_client(id_mar_street_fk, name, cpf)VALUES(1, 'Jorge Matos', 67688900566);
INSERT INTO mar_client(id_mar_street_fk, name, cpf)VALUES(3, 'Andre de oliveira', 47577900555);
INSERT INTO mar_client(id_mar_street_fk, name, cpf)VALUES(4, 'Amanda Santa', 57588900533);
INSERT INTO mar_client(id_mar_street_fk, name, cpf)VALUES(2, 'Douglas Bullet', 97988900599);

SELECT * FROM mar_client;


--#3 Market

CREATE SEQUENCE seq_mar_merchandise START WITH 1 NOCACHE INCREMENT BY 1;

CREATE TABLE mar_merchandise(
   id_mar_merchandise_pk NUMBER DEFAULT seq_mar_merchandise.NEXTVAL NOT NULL
  ,name VARCHAR(255)
  ,cust_price NUMBER
  ,sell_price NUMBER
  ,stock NUMBER
  ,CONSTRAINT pk_id_mar_merchandise PRIMARY KEY(id_mar_merchandise_pk)
);

INSERT INTO mar_merchandise(name, cust_price, sell_price, stock)VALUES('Goiaba', 2, 4, 30 );
INSERT INTO mar_merchandise(name, cust_price, sell_price, stock)VALUES('Melancia', 5, 8, 40);
INSERT INTO mar_merchandise(name, cust_price, sell_price, stock)VALUES('Laranja', 1.5, 3, 50);
INSERT INTO mar_merchandise(name, cust_price, sell_price, stock)VALUES('Leite', 2.5,5 , 24);
INSERT INTO mar_merchandise(name, cust_price, sell_price, stock)VALUES('Bolocha', 1.5, 3.9, 8);
INSERT INTO mar_merchandise(name, cust_price, sell_price, stock)VALUES('Massa de tomate', 1.9, 4, 14);
INSERT INTO mar_merchandise(name, cust_price, sell_price, stock)VALUES('Arroz', 4.9, 11, 15);
INSERT INTO mar_merchandise(name, cust_price, sell_price, stock)VALUES('Feijão', 3.5, 7, 13);
INSERT INTO mar_merchandise(name, cust_price, sell_price, stock)VALUES('Queijo', 5, 14, 6);
INSERT INTO mar_merchandise(name, cust_price, sell_price, stock)VALUES('Refrigerante', 4, 8, 16);
INSERT INTO mar_merchandise(name, cust_price, sell_price, stock)VALUES('Abobora', 3, 7, 22);
INSERT INTO mar_merchandise(name, cust_price, sell_price, stock)VALUES('Pasta de dente', 6, 14, 10);
INSERT INTO mar_merchandise(name, cust_price, sell_price, stock)VALUES('Creme dental', 6.5, 9.9, 18);
INSERT INTO mar_merchandise(name, cust_price, sell_price, stock)VALUES('Vassoura', 8.5, 12.9, 6);

SELECT * FROM mar_merchandise;

--#4 Sales

CREATE SEQUENCE seq_mar_sales START WITH 1 NOCACHE INCREMENT BY 1;

CREATE TABLE mar_sales(
   id_mar_sales_pk NUMBER DEFAULT seq_mar_sales.NEXTVAL NOT NULL
  ,id_mar_client_fk NUMBER
  ,id_mar_merchandise_fk NUMBER
  ,id_mar_employees_fk NUMBER
  ,CONSTRAINT pk_id_mar_sales PRIMARY KEY(id_mar_sales_pk)
);

ALTER TABLE mar_sales ADD CONSTRAINT fk_id_mar_sales_client FOREIGN KEY(id_mar_client_fk) REFERENCES mar_client(id_mar_client_pk);
ALTER TABLE mar_sales ADD CONSTRAINT fk_id_mar_sales_merchandise FOREIGN KEY(id_mar_merchandise_fk) REFERENCES mar_merchandise(id_mar_merchandise_pk);
ALTER TABLE mar_sales ADD CONSTRAINT fk_id_mar_sales_employees FOREIGN KEY(id_mar_employees_fk) REFERENCES mar_employees(id_mar_employees_pk);

INSERT INTO mar_sales(id_mar_client_fk, id_mar_merchandise_fk, id_mar_employees_fk)VALUES( 2, 5, 1);
INSERT INTO mar_sales(id_mar_client_fk, id_mar_merchandise_fk, id_mar_employees_fk)VALUES( 2, 1, 1);
INSERT INTO mar_sales(id_mar_client_fk, id_mar_merchandise_fk, id_mar_employees_fk)VALUES( 2, 1, 1);
INSERT INTO mar_sales(id_mar_client_fk, id_mar_merchandise_fk, id_mar_employees_fk)VALUES( 2, 6, 1);
INSERT INTO mar_sales(id_mar_client_fk, id_mar_merchandise_fk, id_mar_employees_fk)VALUES( 2, 10, 1);
INSERT INTO mar_sales(id_mar_client_fk, id_mar_merchandise_fk, id_mar_employees_fk)VALUES( 2, 12, 1);
INSERT INTO mar_sales(id_mar_client_fk, id_mar_merchandise_fk, id_mar_employees_fk)VALUES( 2, 9, 1);
INSERT INTO mar_sales(id_mar_client_fk, id_mar_merchandise_fk, id_mar_employees_fk)VALUES( 2, 4, 1);
INSERT INTO mar_sales(id_mar_client_fk, id_mar_merchandise_fk, id_mar_employees_fk)VALUES( 4, 1, 2);
INSERT INTO mar_sales(id_mar_client_fk, id_mar_merchandise_fk, id_mar_employees_fk)VALUES( 4, 1, 2);
INSERT INTO mar_sales(id_mar_client_fk, id_mar_merchandise_fk, id_mar_employees_fk)VALUES( 4, 2, 2);
INSERT INTO mar_sales(id_mar_client_fk, id_mar_merchandise_fk, id_mar_employees_fk)VALUES( 4, 4, 2);
INSERT INTO mar_sales(id_mar_client_fk, id_mar_merchandise_fk, id_mar_employees_fk)VALUES( 1, 14, 1);

SELECT * FROM mar_sales;

--#5 Junction

SELECT
      cli.name
     ,mer.name
     ,emp.name
FROM mar_sales sal
JOIN mar_client cli
  ON sal.id_mar_client_fk = cli.id_mar_client_pk
JOIN mar_merchandise mer
  ON sal.id_mar_merchandise_fk = mer.id_mar_merchandise_pk
JOIN mar_employees emp
  ON sal.id_mar_employees_fk = emp.id_mar_employees_pk;


--#6 View total and Bigger

CREATE OR REPLACE VIEW mar_sales_sum(name_client, total) AS
SELECT
      cli.name AS name_client
     ,TRIM(TO_CHAR(SUM(mer.sell_price),'l99g999d99')) AS total
FROM mar_sales sal
JOIN mar_merchandise mer
  ON sal.id_mar_merchandise_fk = mer.id_mar_merchandise_pk
JOIN mar_client cli
  ON sal.id_mar_client_fk = cli.id_mar_client_pk
GROUP BY cli.name
ORDER BY MIN(mer.sell_price);

SELECT * FROM mar_sales_sum;


--#7 Total in period of employees


CREATE OR REPLACE VIEW mar_sales_employees_sum(name_employees, total) AS
SELECT
      emp.name AS name_employees
     ,TRIM(TO_CHAR(SUM(mer.sell_price),'l99g999d99')) AS total
FROM mar_sales sal
JOIN mar_merchandise mer
  ON sal.id_mar_merchandise_fk = mer.id_mar_merchandise_pk
JOIN mar_employees emp
  ON sal.id_mar_employees_fk = emp.id_mar_employees_pk
GROUP BY emp.name;


SELECT * FROM mar_sales_employees_sum;

--#8 Avg_client

CREATE OR REPLACE VIEW mar_sales_client_avg(name_client, total) AS
SELECT
      cli.name AS name_client
     ,TRIM(TO_CHAR(Avg(mer.sell_price),'l99g999d99')) AS total
FROM mar_sales sal
JOIN mar_merchandise mer
  ON sal.id_mar_merchandise_fk = mer.id_mar_merchandise_pk
JOIN mar_client cli
  ON sal.id_mar_client_fk = cli.id_mar_client_pk
GROUP BY cli.name
ORDER BY MIN(mer.sell_price);

SELECT * FROM mar_sales_client_avg;

--#9 total

CREATE OR REPLACE VIEW mar_sales_total(Total) AS
SELECT
     TRIM(TO_CHAR(SUM(mer.sell_price),'l99g999d99')) AS Total
FROM mar_sales sal
JOIN mar_merchandise mer
  ON sal.id_mar_merchandise_fk = mer.id_mar_merchandise_pk

SELECT * FROM mar_sales_total;


CREATE OR REPLACE VIEW mar_sales_avg(Sales, Total) AS
SELECT
      COUNT(id_mar_sales_pk) AS Sales
     ,TRIM(TO_CHAR(AVG(mer.sell_price),'l99g999d99')) AS Total
FROM mar_sales sal
JOIN mar_merchandise mer
  ON sal.id_mar_merchandise_fk = mer.id_mar_merchandise_pk;

SELECT * FROM mar_sales_avg;


--End













