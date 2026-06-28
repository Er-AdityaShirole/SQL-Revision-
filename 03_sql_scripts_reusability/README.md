# 03 SQL Scripts and Reusability

## 1. Writing SQL as a Script
Instead of running SQL queries line-by-line interactively, you can write them into a `.sql` text file (a script). This is crucial in production environments for several reasons:
- **Version Control:** You can commit `.sql` files to git.
- **Automation:** Scripts can be executed on schedules or CI/CD pipelines.
- **Repeatability:** Easily recreate schemas or populate test data.

---

## 2. Reusing and Running Scripts

There are two primary ways to run an SQL script:

### Method A: Inside the MySQL Client Shell
If you are already logged into the MySQL interactive command line:
```sql
-- Use the 'source' command followed by the absolute or relative path to the script
SOURCE C:/Users/lenovo/Desktop/SQL/02_creating_dropping_databases_tables/create_drop.sql;

-- Alternative shorthand syntax
\. C:/Users/lenovo/Desktop/SQL/02_creating_dropping_databases_tables/create_drop.sql
```

### Method B: From the System Terminal (CLI)
To run a script directly from PowerShell or Command Prompt without logging in interactively first, redirect the file into the `mysql` CLI:
```bash
# Redirecting file contents
mysql -u your_username -p school_db < "C:\Users\lenovo\Desktop\SQL\02_creating_dropping_databases_tables\create_drop.sql"

# Alternative using the execute flag (-e or --execute)
mysql -u your_username -p -e "source C:/Users/lenovo/Desktop/SQL/02_creating_dropping_databases_tables/create_drop.sql" school_db
```
