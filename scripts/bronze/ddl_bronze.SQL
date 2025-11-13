/*
===============================================================================
DDL Script: Create Bronze Tables
===============================================================================
Script Purpose:
    This script creates tables in the 'bronze' schema.
	  Run this script to re-define the DDL structure of 'bronze' Tables
===============================================================================
*/

CREATE TABLE bronze.customers (
    customer_id INT IDENTITY PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    created_at DATETIME
);

CREATE TABLE bronze.accounts (
    account_id INT IDENTITY PRIMARY KEY,
    customer_id INT,
    account_num VARCHAR(30),
    account_type VARCHAR(20),
    currency CHAR(3),
    opened_date DATE
);

CREATE TABLE bronze.merchant_categories (
    category_id INT IDENTITY PRIMARY KEY,
    category_name VARCHAR(50)
);

CREATE TABLE bronze.merchants (
    merchant_id INT IDENTITY PRIMARY KEY,
    merchant_name VARCHAR(100),
    category_id INT
);

CREATE TABLE bronze.cards (
    card_id INT IDENTITY PRIMARY KEY,
    account_id INT,
    card_type VARCHAR(10),
    opened_date DATE,
    credit_limit DECIMAL(12,2)
);

CREATE TABLE bronze.transactions (
    txn_id INT IDENTITY PRIMARY KEY,
    account_id INT,
    txn_date DATETIME,
    txn_type VARCHAR(20),
    amount DECIMAL(12,2),
    description VARCHAR(200),
    merchant_id INT,
    related_txn_id INT
);

CREATE TABLE bronze.card_transactions (
    card_txn_id INT IDENTITY PRIMARY KEY,
    card_id INT,
    txn_date DATETIME,
    amount DECIMAL(12,2),
    merchant_id INT
);

CREATE TABLE bronze.loans (
    loan_id INT IDENTITY PRIMARY KEY,
    customer_id INT,
    principal DECIMAL(12,2),
    interest_rate DECIMAL(5,2),
    term_months INT,
    start_date DATE,
    status VARCHAR(20)
);

CREATE TABLE bronze.loan_payments (
    payment_id INT IDENTITY PRIMARY KEY,
    loan_id INT,
    payment_date DATE,
    amount DECIMAL(12,2),
    principal_paid DECIMAL(12,2),
    interest_paid DECIMAL(12,2)
);
GO

