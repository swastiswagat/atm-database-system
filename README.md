# atm-database-system

A database-driven ATM management system built using SQL to manage and track ATM transactions, user accounts, and system settings.

## Table of Contents

1. [Overview](#overview)
2. [Features](#features)
3. [Database Schema](#database-schema)
4. [SQL Queries](#sql-queries)
5. [Usage](#usage)
6. [Contributing](#contributing)
7. [License](#license)

## Overview

This ATM management system is designed to provide a secure and efficient way to manage ATM transactions, user accounts, and system settings. The system uses a relational database management system (RDBMS) to store and retrieve data.

## Features

* User account management: create, update, and delete user accounts
* Transaction management: record and track ATM transactions (withdrawals, deposits, transfers)
* System settings management: configure system settings (e.g., ATM location, currency)
* Reporting: generate reports on transactions, user accounts, and system activity

## Database Schema

The database schema consists of the following tables:

* `users`: stores user account information (username, password, account balance)
* `transactions`: stores transaction records (transaction ID, user ID, transaction type, amount)
* `system_settings`: stores system settings (ATM location, currency)

## SQL Queries

The system uses SQL queries to interact with the database. Some examples of SQL queries used in the system include:

* `CREATE TABLE users (id INT PRIMARY KEY, username VARCHAR(50), password VARCHAR(255), account_balance DECIMAL(10, 2));`
* `INSERT INTO transactions (user_id, transaction_type, amount) VALUES (1, 'withdrawal', 100.00);`
* `SELECT * FROM users WHERE username = 'john_doe';`

## Usage

To use the system, follow these steps:

1. Install the required database management system (e.g., MySQL, PostgreSQL)
2. Create a new database and import the database schema
3. Configure the system settings (e.g., ATM location, currency)
4. Create user accounts and assign permissions
5. Use the system to record and track ATM transactions

## Contributing

Contributions are welcome! If you'd like to contribute to the project, please fork the repository and submit a pull request.

## License
  [None]
