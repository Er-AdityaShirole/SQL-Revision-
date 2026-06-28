# SQL Revision Notes - Day 1

This repository contains my SQL revision notes, structured topic-wise, for my learning and interview preparation. 

## Reference Lecture
- **Lecture Link:** [SQL Tutorial for Beginners (Complete Course using MySQL)](https://www.youtube.com/watch?v=yE6tIle64tU&t=1601s) by Code With Harry.

---

## Index of Topics (Day 1)

1. [**01 Database Basics**](./01_database_basics/README.md)
   - What is a Database?
   - Difference between DBMS and RDBMS.
2. [**02 Creating and Dropping Databases & Tables**](./02_creating_dropping_databases_tables/README.md)
   - Creating Databases and Tables.
   - Dropping Databases and Tables.
3. [**03 SQL Scripts and Reusability**](./03_sql_scripts_reusability/README.md)
   - Writing SQL queries as a script.
   - Reusing scripts using command line interface/source commands.
4. [**04 Data Types and Basic Constraints**](./04_data_types_constraints_intro/README.md)
   - Essential MySQL Data Types (INT, VARCHAR, DATE, etc.).
   - Basic constraints introduction.
5. [**05 Inserting Data**](./05_inserting_data/README.md)
   - Data insertion statements.
   - Default values and behavior of nullable/non-nullable columns on omission.
6. [**06 Selecting and Querying Data**](./06_selecting_querying_data/README.md)
   - Retrieving data, selecting specific columns vs `SELECT *`.
   - Inspection methods (DESC, SHOW CREATE TABLE, LIMIT for large datasets).
   - Filtering with `WHERE` and `BETWEEN` (inclusive range).
   - `NULL` comparisons and Three-Valued Logic (`IS NULL` vs `= NULL`).
   - Sorting with `ORDER BY` (non-mutating presentation) and the Query Execution Order.
7. [**07 Altering Tables**](./07_altering_tables/README.md)
   - Renaming/modifying columns.
   - Column reordering (`AFTER`, `FIRST`).
   - Altering tables containing data and VARCHAR reduction risks.
8. [**08 Updating and Deleting Data**](./08_updating_deleting_data/README.md)
   - Updating rows with `UPDATE`.
   - Deleting rows with `DELETE` (safety practices with prior `SELECT` check).
   - Difference between `DELETE`, `TRUNCATE`, and `DROP`.
9. [**09 Constraints in Detail**](./09_constraints_in_detail/README.md)
   - Column vs Table constraints.
   - Naming UNIQUE/PRIMARY KEY/CHECK constraints.
   - Why we can't name `NOT NULL` constraints.
   - `AUTO_INCREMENT` column attribute.
10. [**10 MySQL Functions & GROUP BY**](./10_mysql_functions/README.md)
    - Functions in MySQL.
    - MySQL `IF()` inline function (conditional results, `SUM(IF())` count aggregation trick).
    - `IF()` vs `WHERE` and `IF()` vs `CASE`.
    - `GROUP BY` vs `WHERE` and rules for non-aggregated columns.
11. [**11 Autocommit & Transactions**](./11_autocommit_transactions/README.md)
    - What is Autocommit?
    - How to manage it.
