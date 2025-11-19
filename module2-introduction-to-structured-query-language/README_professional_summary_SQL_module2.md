# 📊 Module 2: Introduction to Structured Query Language (SQL)

**Course:** Introduction to Structured Query Language (SQL)  
**Platform:** Coursera – University of Michigan  
**Instructor:** Dr. Charles Severance  
**Module Folder:** `module2-introduction-to-structured-query-language/ages-table`

⸻

## 🎯 Objective

This module introduced foundational SQL operations using a simple dataset of names and ages. The goal was to:
- Create a table called `Ages`
- Populate it with random name–age pairs
- Write queries to retrieve the first entry alphabetically (by name)
- Run the assignment using both MySQL and SQLite-compatible syntax

⸻

## 🧠 What I Learned

- How to write `CREATE TABLE`, `INSERT`, and `SELECT` statements
- Understanding data types (`INTEGER`, `TEXT`) and their SQLite-specific behavior
- The importance of `ORDER BY` and `LIMIT` clauses in query structure
- Key differences between MySQL and SQLite syntax and how to adapt queries for compatibility

⸻

## 🧪 Assignment Breakdown

📁 **Key Files:**
- `ages.sqlite` – SQLite database file
- `sqlite_ages.sql` – SQL script used for SQLite version
- `mysql_ages.sql` – Adapted script for MySQL
- `module2_answer.txt` – Final query used to retrieve the result
- `Output_First Row.png` – Screenshot of result row
- `Ages_Assignment_Instructions.png` – Assignment prompt screenshot

📄 **Step-by-step Files:**
- `StepbyStep_The Ages Table.txt` – Logic breakdown
- `Python (sqlite3) version.txt` – Python snippet using `sqlite3`
- `SQLite compatible version.txt` – Syntax notes for SQLite engine

📄 **Assignment Summary:**
- Created a simple `Ages` table with two fields: `name` and `age`
- Inserted random values into the table
- Ran the following query to return the first alphabetical entry:

```sql
SELECT name, age FROM Ages ORDER BY name LIMIT 1;


Captured the result in both SQLite and GUI form

⸻

🧩 Compatibility Considerations

This module emphasized the value of keeping SQL flexible across engines. I kept a dedicated folder for:

SQLite-specific code

MySQL-compatible variant

📁 See subfolder: ages-table/

⸻

🧠 Reflection

This was the first real hands-on SQL experience. While the logic was simple, it solidified how structured queries behave across platforms. I also realized how easy it is to make syntax errors that silently fail or behave differently depending on the SQL engine.

As a simulation technologist, I can see this structure being used for small training record systems, user profile stores, or backend configurations for XR content.