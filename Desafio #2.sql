
/*
Drugstore project
Obs: do not have stock as it is a drop shipping project.

1 - Location

2 - employees

3 - Lab

4 - Medicines

5 - Sale price

6 - Customers

7 - Requests

8 - Order confirmation

--Selects

9 - Purchase verification

10 - Employee sales amount

11 - Highest selling employee

12 - Customer who bought the most

13 - Function freight

*/


--1

CREATE SEQUENCE seq_drugstore_street START WITH 1 NOCACHE INCREMENT BY 1;

CREATE TABLE drugst_street(
   id_drugst_street_pk NUMBER DEFAULT seq_drugstore_street.NEXTVAL NOT NULL
  ,name VARCHAR(255)
  ,distance NUMBER
  ,CONSTRAINT pk_id_drugst_street PRIMARY KEY(id_drugst_street_pk)
);


INSERT INTO drugst_street(name, distance) VALUES('Gomes Ferreira', 7);
INSERT INTO drugst_street(name, distance) VALUES('Rafael Oliveira', 5);
INSERT INTO drugst_street(name, distance) VALUES('Andrade da Silva', 13);
INSERT INTO drugst_street(name, distance) VALUES('Pedro Alves', 18);
INSERT INTO drugst_street(name, distance) VALUES('Otavio de Costas', 20);
INSERT INTO drugst_street(name, distance) VALUES('Sergio Matos', 9);
INSERT INTO drugst_street(name, distance) VALUES('Itamar de Freitas', 27);
INSERT INTO drugst_street(name, distance) VALUES('Medeiros', 2);
INSERT INTO drugst_street(name, distance) VALUES('Alan Tavares', 15);
INSERT INTO drugst_street(name, distance) VALUES('Marcos Tiradentes', 22);
INSERT INTO drugst_street(name, distance) VALUES('Leticia de Maroes', 20);
INSERT INTO drugst_street(name, distance) VALUES('Julia Mota', 32);
INSERT INTO drugst_street(name, distance) VALUES('Beatriz', 40);
INSERT INTO drugst_street(name, distance) VALUES('Romana De Amores', 35);


SELECT * FROM drugst_street;

--2

CREATE SEQUENCE seq_drugst_employees START WITH 1 NOCACHE INCREMENT BY 1;

CREATE TABLE drugst_employees(
   id_drugst_employees_pk NUMBER DEFAULT seq_drugst_employees.NEXTVAL NOT NULL
  ,id_drugst_street_fk NUMBER
  ,name VARCHAR(255)
  ,age NUMBER
  ,salary NUMBER
  ,contract DATE
  ,CONSTRAINT pk_drugst_employees PRIMARY KEY(id_drugst_employees_pk)
);

ALTER TABLE drugst_employees ADD CONSTRAINT fk_drugst_street FOREIGN KEY (id_drugst_street_fk) REFERENCES drugst_street(id_drugst_street_pk);

INSERT INTO drugst_employees(id_drugst_street_fk, name, age, salary, contract) VALUES (4 ,'Leandro Castro', 22, 1300, SYSDATE -300);
INSERT INTO drugst_employees(id_drugst_street_fk, name, age, salary, contract) VALUES (2 ,'Matheus Duarte', 19, 1200, SYSDATE -80);


SELECT * FROM drugst_employees;

--3

CREATE SEQUENCE seq_drugst_lab START WITH 1 NOCACHE INCREMENT BY 1;

CREATE TABLE drugst_lab(
   id_drugst_lab_pk NUMBER DEFAULT seq_drugst_lab.NEXTVAL NOT NULL
  ,id_drugst_street_fk NUMBER
  ,name VARCHAR(255)
  ,rating NUMBER
  ,CONSTRAINT pk_id_drugst_lab PRIMARY KEY (id_drugst_lab_pk)
);

ALTER TABLE drugst_lab ADD CONSTRAINT fk_drugst_street_lab FOREIGN KEY (id_drugst_street_fk) REFERENCES drugst_street(id_drugst_street_pk);

INSERT INTO drugst_lab(id_drugst_street_fk, name, rating) VALUES(14 ,'Zodiac' ,9 );
INSERT INTO drugst_lab(id_drugst_street_fk, name, rating) VALUES(13 ,'Tommasi' ,8 );
INSERT INTO drugst_lab(id_drugst_street_fk, name, rating) VALUES(12 ,'Droxter' ,7 );
INSERT INTO drugst_lab(id_drugst_street_fk, name, rating) VALUES(15 ,'Novaarts' ,8 );
INSERT INTO drugst_lab(id_drugst_street_fk, name, rating) VALUES(15 ,'Teva' ,6 );
INSERT INTO drugst_lab(id_drugst_street_fk, name, rating) VALUES(7 ,'Servier' ,9 );

SELECT * FROM drugst_lab;

--4

CREATE SEQUENCE seq_drugst_drug START WITH 1 NOCACHE INCREMENT BY 1;

CREATE TABLE drugst_drug(
   id_drugst_drug_pk NUMBER DEFAULT seq_drugst_drug.NEXTVAL NOT NULL
  ,id_drugst_lab_fk NUMBER
  ,type NUMBER
  ,name VARCHAR(255)
  ,cust_price NUMBER
  ,CONSTRAINT pk_drugst_drug PRIMARY KEY(id_drugst_drug_pk)
);

ALTER TABLE drugst_drug ADD CONSTRAINT fk_drugst_drug_lab FOREIGN KEY (id_drugst_lab_fk) REFERENCES drugst_lab(id_drugst_lab_pk);

INSERT INTO drugst_drug(id_drugst_lab_fk, type,name, cust_price) VALUES(5, 1,'Dorflex', 3.50);
INSERT INTO drugst_drug(id_drugst_lab_fk, type,name, cust_price) VALUES(3, 1,'Dorflex', 3.80);
INSERT INTO drugst_drug(id_drugst_lab_fk, type,name, cust_price) VALUES(1, 1,'Dorflex', 4.16);
INSERT INTO drugst_drug(id_drugst_lab_fk, type,name, cust_price) VALUES(6, 1,'Dorflex', 4.20);
INSERT INTO drugst_drug(id_drugst_lab_fk, type,name, cust_price) VALUES(1, 2,'Puran', 8.30);
INSERT INTO drugst_drug(id_drugst_lab_fk, type,name, cust_price) VALUES(4, 2,'Puran', 8.10);
INSERT INTO drugst_drug(id_drugst_lab_fk, type,name, cust_price) VALUES(2, 2,'Puran', 8.15);
INSERT INTO drugst_drug(id_drugst_lab_fk, type,name, cust_price) VALUES(6, 1,'Neosaldina', 14.45);
INSERT INTO drugst_drug(id_drugst_lab_fk, type,name, cust_price) VALUES(5, 1,'Neosaldina', 13.20);
INSERT INTO drugst_drug(id_drugst_lab_fk, type,name, cust_price) VALUES(4, 1,'Neosaldina', 14.60);
INSERT INTO drugst_drug(id_drugst_lab_fk, type,name, cust_price) VALUES(3, 1,'Neosaldina', 14);
INSERT INTO drugst_drug(id_drugst_lab_fk, type,name, cust_price) VALUES(3, 1,'Torsilax', 11.25);
INSERT INTO drugst_drug(id_drugst_lab_fk, type,name, cust_price) VALUES(6, 1,'Torsilax', 11.95);
INSERT INTO drugst_drug(id_drugst_lab_fk, type,name, cust_price) VALUES(1, 2,'Victoza', 230.75);
INSERT INTO drugst_drug(id_drugst_lab_fk, type,name, cust_price) VALUES(5, 2,'Victoza', 195.33);
INSERT INTO drugst_drug(id_drugst_lab_fk, type,name, cust_price) VALUES(2, 1,'Addera D3', 36.80);
INSERT INTO drugst_drug(id_drugst_lab_fk, type,name, cust_price) VALUES(5, 1,'Addera D3', 30.55);
INSERT INTO drugst_drug(id_drugst_lab_fk, type,name, cust_price) VALUES(3, 1,'Addera D3', 33.43);

SELECT * FROM drugst_drug;



--5

CREATE OR REPLACE VIEW drugst_drug_view AS
SELECT
    id_drugst_drug_pk,
    id_drugst_lab_fk,
    type,
    name,
    cust_price,
    cust_price * 1.4 AS sale_price
FROM drugst_drug;

SELECT * FROM drugst_drug_view;



--6

CREATE SEQUENCE seq_drugst_client START WITH 1 NOCACHE INCREMENT BY 1;

CREATE TABLE drugst_client(
   id_drugst_client_pk NUMBER DEFAULT seq_drugst_client.NEXTVAL NOT NULL
  ,id_drugst_street_fk NUMBER
  ,name VARCHAR(255)
  ,age NUMBER
  ,gender VARCHAR(255)
  ,cpf NUMBER
  ,phone NUMBER
  ,CONSTRAINT pk_drugst_client PRIMARY KEY(id_drugst_client_pk)
);

ALTER TABLE drugst_client ADD CONSTRAINT fk_drugst_street_client FOREIGN KEY (id_drugst_street_fk) REFERENCES drugst_street(id_drugst_street_pk);


INSERT INTO drugst_client(id_drugst_street_fk, name, age, gender, cpf, phone) VALUES( 4,'Regina Emanuelly Brenda Campos', 31,'Feminine', 48421138049, 47989547798);
INSERT INTO drugst_client(id_drugst_street_fk, name, age, gender, cpf, phone) VALUES( 7,'Benjamin Caleb Lucca Moura', 22, 'Masculine', 10522488021, 51996142753);
INSERT INTO drugst_client(id_drugst_street_fk, name, age, gender, cpf, phone) VALUES( 2,'Mateus Martin Lopes', 43, 'Masculine', 49198805029, 96983499039);

SELECT * FROM drugst_client;


--7

CREATE OR REPLACE VIEW drugst_drug_view AS
SELECT
    id_drugst_drug_pk,
    id_drugst_lab_fk,
    type,
    name,
    cust_price,
    cust_price * 1.4 AS sale_price
FROM drugst_drug;

SELECT * FROM drugst_drug_view;



CREATE SEQUENCE seq_drugst_requests START WITH 1 NOCACHE INCREMENT BY 1;

CREATE TABLE drugst_requests(
   id_drugst_requests_pk NUMBER DEFAULT seq_drugst_requests.NEXTVAL NOT NULL
  ,id_drugst_employees_fk NUMBER NOT NULL
  ,id_drugst_client_fk NUMBER
  ,id_drugst_drug_fk NUMBER NOT NULL
  ,sale_date DATE
  ,CONSTRAINT pk_drugts_request PRIMARY KEY(id_drugst_requests_pk)
);

ALTER TABLE drugst_requests ADD CONSTRAINT fk_drugst_requests_employees FOREIGN KEY (id_drugst_employees_fk) REFERENCES drugst_employees(id_drugst_employees_pk);
ALTER TABLE drugst_requests ADD CONSTRAINT fk_drugst_requests_client FOREIGN KEY (id_drugst_client_fk) REFERENCES drugst_client(id_drugst_client_pk);
ALTER TABLE drugst_requests ADD CONSTRAINT fk_drugst_requests_drug FOREIGN KEY (id_drugst_drug_fk) REFERENCES drugst_drug(id_drugst_drug_pk);


INSERT INTO drugst_requests(id_drugst_employees_fk, id_drugst_client_fk, id_drugst_drug_fk, sale_date )VALUES( 1, 3, 8, SYSDATE);
INSERT INTO drugst_requests(id_drugst_employees_fk, id_drugst_client_fk, id_drugst_drug_fk, sale_date )VALUES( 2, 2, 3, SYSDATE);
INSERT INTO drugst_requests(id_drugst_employees_fk, id_drugst_client_fk, id_drugst_drug_fk, sale_date )VALUES( 1, 3, 14, SYSDATE);
INSERT INTO drugst_requests(id_drugst_employees_fk, id_drugst_client_fk, id_drugst_drug_fk, sale_date )VALUES( 1, 1, 5, SYSDATE);
INSERT INTO drugst_requests(id_drugst_employees_fk, id_drugst_client_fk, id_drugst_drug_fk, sale_date )VALUES( 1, 1, 9, SYSDATE);

SELECT * FROM drugst_requests;

--8

CREATE SEQUENCE seq_drugst_confirmation START WITH 1 NOCACHE INCREMENT BY 1;

CREATE TABLE drugst_confirmation (
   id_drugst_confirmation_pk NUMBER DEFAULT seq_drugst_confirmation.NEXTVAL NOT NULL
  ,id_drugst_requests_fk NUMBER NOT NULL
  ,sale_price NUMBER
  ,CONSTRAINT pk_drugst_confirmation PRIMARY KEY (id_drugst_confirmation_pk)
  ,CONSTRAINT fk_drugst_requests_confirmation FOREIGN KEY (id_drugst_requests_fk) REFERENCES drugst_requests(id_drugst_requests_pk)
);

INSERT INTO drugst_confirmation (id_drugst_requests_fk, sale_price)
SELECT
   req.id_drugst_requests_pk
  ,d.sale_price
FROM drugst_requests req
JOIN drugst_drug_view d ON req.id_drugst_drug_fk = d.id_drugst_drug_pk
WHERE NOT EXISTS(
SELECT 1
FROM drugst_confirmation con
WHERE con.id_drugst_requests_fk = req.id_drugst_requests_pk);


SELECT * FROM drugst_confirmation;


--9 Purchase verification

SELECT
   cli.name AS client_name
  ,emp.name AS employee_name
  ,dru.name AS drug_name
  ,cli.phone AS client_phone
  ,dru.sale_price AS drug_sale_price
FROM drugst_confirmation con
JOIN drugst_requests req ON con.id_drugst_requests_fk = req.id_drugst_requests_pk
JOIN drugst_client cli ON req.id_drugst_client_fk = cli.id_drugst_client_pk
JOIN drugst_employees emp ON req.id_drugst_employees_fk = emp.id_drugst_employees_pk
JOIN drugst_drug_view dru ON req.id_drugst_drug_fk = dru.id_drugst_drug_pk;


--10 Employee sales amount

CREATE OR REPLACE VIEW drugst_sales_view AS
SELECT
    emp.name AS employee_name,
    COUNT(*) AS total_sales
FROM drugst_employees emp
JOIN drugst_requests r ON emp.id_drugst_employees_pk = r.id_drugst_employees_fk
GROUP BY emp.name;

SELECT * FROM drugst_sales_view;



--11 Highest selling employee

CREATE OR REPLACE VIEW drugst_sales_employee_view AS
SELECT
   emp.name AS employee_name
  ,SUM(con.sale_price) AS total_sales
FROM drugst_confirmation con
JOIN drugst_requests req ON con.id_drugst_requests_fk = req.id_drugst_requests_pk
JOIN drugst_employees emp ON req.id_drugst_employees_fk = emp.id_drugst_employees_pk
GROUP BY emp.name
ORDER BY total_sales DESC;

SELECT * FROM drugst_sales_employee_view;


--12 Customer who bought the most

CREATE OR REPLACE VIEW drugst_client_purchase_view AS
SELECT
    cli.name AS client_name
   ,SUM(con.sale_price) AS total_spent
FROM drugst_confirmation con
JOIN drugst_requests req ON con.id_drugst_requests_fk = req.id_drugst_requests_pk
JOIN drugst_client cli ON req.id_drugst_client_fk = cli.id_drugst_client_pk
GROUP BY cli.name
ORDER BY total_spent DESC;

SELECT * FROM drugst_client_purchase_view;


--13 Freight

CREATE OR REPLACE FUNCTION calculate_shipping(distance_in_km NUMBER) RETURN NUMBER AS
  shipping_rate_per_km NUMBER := 2.5;
BEGIN
  RETURN distance_in_km * shipping_rate_per_km;
END;

SELECT
   name
  ,distance
  ,calculate_shipping(distance) AS shipping_cost
FROM drugst_street;



COMMIT;