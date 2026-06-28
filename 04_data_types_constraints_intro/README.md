# 04 Data Types and Basic Constraints

## 1. Common Data Types in MySQL

Choosing the correct data type is essential for storage optimization and data integrity.

| Category | Data Type | Description | Example |
| :--- | :--- | :--- | :--- |
| **Numeric** | `INT` | Standard integer value. | `id INT` |
| | `DECIMAL(p, s)` | Fixed-point exact decimal. `p` is total digits; `s` is digits after decimal. | `salary DECIMAL(8, 2)` (e.g., 999999.99) |
| | `FLOAT` / `DOUBLE` | Floating-point values (approximate decimals). | `rating FLOAT` |
| **String** | `VARCHAR(M)` | Variable-length string up to `M` characters. | `name VARCHAR(50)` |
| | `CHAR(M)` | Fixed-length string (padded with spaces). | `gender CHAR(1)` |
| | `TEXT` | Long text field. | `bio TEXT` |
| **Date/Time** | `DATE` | Date value formatted as `YYYY-MM-DD`. | `dob DATE` |
| | `DATETIME` | Date and time formatted as `YYYY-MM-DD HH:MM:SS`. | `created_at DATETIME` |

---

## 2. Basic Constraints Introduction
Constraints are rules applied to columns to limit the type of data that can go into a table. This ensures the accuracy and reliability of the data.

- **`NOT NULL`**: Ensures that a column cannot have a `NULL` value.
- **`UNIQUE`**: Ensures that all values in a column are distinct.
- **`PRIMARY KEY`**: A combination of `NOT NULL` and `UNIQUE`. Uniquely identifies each row in a table.
- **`DEFAULT`**: Provides a default value for a column when no value is specified during an `INSERT`.
- **`CHECK`**: Ensures that the values in a column satisfy a specific condition.
- **`FOREIGN KEY`**: Prevents actions that would destroy links between tables.
