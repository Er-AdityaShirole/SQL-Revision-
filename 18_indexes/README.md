# 18 Indexes

An **Index** is a physical pointer structure (usually B-Tree) that speeds up the retrieval of rows from a table. Think of it like the index at the back of a textbook: instead of scanning every page (Full Table Scan), you look up the term in the index and jump directly to the page.

---

## 1. Types of Indexes in MySQL

1. **Clustered Index (Primary Key):**
   - Automatically created when you define a `PRIMARY KEY`.
   - The physical data rows are stored on disk in the order of the clustered index. Only one clustered index can exist per table.
2. **Secondary Index (Non-Clustered / Standard Index):**
   - Created manually to speed up queries on fields frequently used in `WHERE`, `JOIN`, or `ORDER BY` clauses.
   - Holds a pointer back to the primary key/data row.
3. **Unique Index:**
   - Ensures all values in the column are unique. Automatically generated for `UNIQUE` constraints.
4. **Full-Text Index:**
   - Used to perform search-engine-like full-text queries against character data.

---

## 2. Benefits vs. Overhead

### Benefits:
- Dramatic performance speedup for `SELECT` queries with filters.
- Speeds up sorting (`ORDER BY`) and groupings (`GROUP BY`).

### Overhead:
- **Write Performance Penalty:** Slows down `INSERT`, `UPDATE`, and `DELETE` statements because the index structure must be recalculated and rewritten every time data changes.
- **Storage Penalty:** Indexes take up physical memory and disk space.

---

## 3. Verifying Index Usage with `EXPLAIN` (Interview Tip)

You can check whether your query is utilizing an index or performing a slow full table scan by prepending the **`EXPLAIN`** keyword to your `SELECT` query:

```sql
EXPLAIN SELECT * FROM users WHERE email = 'abc@gmail.com';
```

### Key Columns in the `EXPLAIN` output:
- **`type`**: Look for `const`, `eq_ref`, or `ref`. If it says **`ALL`**, it means MySQL is doing a slow **Full Table Scan**.
- **`possible_keys`**: List of indexes MySQL could potentially use.
- **`key`**: The actual index MySQL selected to run the query.
- **`rows`**: Estimated number of rows analyzed. An indexed search should analyze very few rows.
