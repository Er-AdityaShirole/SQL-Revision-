# 01 Database Basics

## 1. What is a Database?
A **database** is a structured collection of data stored and accessed electronically from a computer system. Databases make it easy to store, organize, retrieve, and modify large amounts of data.

## 2. DBMS vs. RDBMS
A Database Management System (DBMS) is software used to manage databases. There are two main types:

| Feature | DBMS (Database Management System) | RDBMS (Relational Database Management System) |
| :--- | :--- | :--- |
| **Data Storage** | Stores data as flat files or in a hierarchical structure. | Stores data in tabular format (tables with rows and columns). |
| **Relationships** | No relationship enforcement between files. | Relationships (foreign keys) link tables together. |
| **SQL Support** | Does not necessarily support SQL. | Fully supports SQL (Structured Query Language). |
| **Data Integrity** | Hard to enforce constraints across files. | Enforces data integrity constraints (Primary Key, Foreign Key, etc.). |
| **Examples** | XML, File Systems, Microsoft Access (partially). | **MySQL**, PostgreSQL, Oracle, SQL Server, SQLite. |

---

## 3. SQL (Structured Query Language)
SQL is the standard language used to communicate with an RDBMS. It allows you to:
- **Query** data (retrieve specific rows/columns)
- **Insert, Update, Delete** data
- **Create, Alter, Drop** database structures (tables, schemas)
