-- Observação:

--As queries a seguir foram feitas na ordem que acredito que o banco de dados deveria ser montado.

CREATE DATABASE "customer_database";

CREATE TABLE states (
id SERIAL NOT NULL PRIMARY KEY,
name VARCHAR(25) NOT NULL UNIQUE
);

CREATE TABLE cities (
id SERIAL NOT NULL PRIMARY KEY,
name VARCHAR(40) NOT NULL UNIQUE,
"stateId" INTEGER REFERENCES states(id)
);

CREATE TABLE customers (
id SERIAL NOT NULL PRIMARY KEY,
name TEXT NOT NULL,
cpf VARCHAR(11) NOT NULL UNIQUE,
email TEXT NOT NULL UNIQUE,
password TEXT NOT NULL
);

CREATE TABLE "customerPhones" (
id SERIAL NOT NULL PRIMARY KEY,
"customerId" INTEGER REFERENCES customers(id),
number VARCHAR (10) NOT NULL,
type TEXT
);
