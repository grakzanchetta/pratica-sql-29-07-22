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

CREATE TABLE "customerAddresses" (
id SERIAL NOT NULL PRIMARY KEY,
"customerId" INTEGER REFERENCES customers(id) UNIQUE,
street VARCHAR (50) NOT NULL,
number INTEGER NOT NULL,
complement VARCHAR (10),
"postalCode" INTEGER NOT NULL,
"cityId" INTEGER REFERENCES cities(id)
);

CREATE TABLE "bankAccount" (
id SERIAL NOT NULL PRIMARY KEY,
"customerId" INTEGER REFERENCES customers(id) UNIQUE,
"accountNumber" INTEGER UNIQUE NOT NULL,
agency INTEGER NOT NULL,
"openDate" TIMESTAMP NOT NULL DEFAULT NOW(),
"closeDate" TIMESTAMP
);

CREATE TABLE transactions (
id SERIAL NOT NULL PRIMARY KEY,
"bankAccountId" INTEGER REFERENCES "bankAccount"(id) UNIQUE,
amount INTEGER NOT NULL,
type VARCHAR(10),
description TEXT,
cancelled TIMESTAMP
);

CREATE TABLE "creditCards" (
ID SERIAL NOT NULL PRIMARY KEY,
"bankAccountId" INTEGER REFERENCES "bankAccount"(id) UNIQUE,
name TEXT NOT NULL,
number INTEGER NOT NULL,
"securiyCode" INTEGER NOT NULL,
"expirationMonth" INTEGER NOT NULL,
"expirationYear" INTEGER NOT NULL,
password INTEGER NOT NULL,
"limit" INTEGER NOT NULL
);















