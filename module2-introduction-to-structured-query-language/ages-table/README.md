# Ages Table — Step‑by‑Step (MySQL + SQLite)

A minimal, reproducible walkthrough to create an `Ages` table, load rows, run checks, and (optionally) compute the hash used in common course challenges. This repo is designed to be copy‑paste friendly.

---

## 1) Prerequisites

- **MySQL** 8+ (or MariaDB 10.3+) *or* **SQLite** 3.x
- A terminal or GUI client (MySQL Shell, MySQL Workbench, DB Browser for SQLite, etc.)

> Charset tip (MySQL): prefer `utf8mb4` to avoid weird character issues.

---

## 2) Create a database (MySQL only)

```sql
-- Create a fresh database and set utf8mb4 as the default charset
CREATE DATABASE IF NOT EXISTS demo_db
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_0900_ai_ci;

-- Switch to it
USE demo_db;
```

> **SQLite users:** skip this step; SQLite uses a single file DB. Just open/create a file (e.g., `demo.db`) in your client.

---

## 3) Create the `Ages` table

> Table name is **Ages** (capital A). Some systems are case‑sensitive. Keep it consistent.

```sql
-- Works on both MySQL and SQLite
DROP TABLE IF EXISTS Ages;

CREATE TABLE Ages (
  name VARCHAR(128),
  age  INTEGER
);
```

---

## 4) Reset and insert the required rows

```sql
DELETE FROM Ages;

INSERT INTO Ages (name, age) VALUES ('Akam', 13);
INSERT INTO Ages (name, age) VALUES ('Oisin', 21);
INSERT INTO Ages (name, age) VALUES ('Mhirren', 34);
INSERT INTO Ages (name, age) VALUES ('Aleeshmah', 25);
INSERT INTO Ages (name, age) VALUES ('Nana', 33);
INSERT INTO Ages (name, age) VALUES ('Blythe', 28);
```

---

## 5) Verify the data

```sql
SELECT * FROM Ages ORDER BY name;
SELECT * FROM Ages ORDER BY age DESC;
SELECT COUNT(*) AS rowcount FROM Ages;
```

Expected rowcount: **6**.

---

## 6) (Optional) Hash query used in the course challenge

Depending on the platform, the one‑liner differs slightly.

### MySQL / MariaDB
```sql
-- Build a deterministic token from name+age, sort, and pick the first
SELECT HEX(MD5(CONCAT(name, age))) AS token
FROM Ages
ORDER BY token
LIMIT 1;
```

### SQLite
```sql
-- SQLite doesn't ship MD5 by default; use lower(hex(md5())) only if your build has md5()
-- Otherwise, you can export and hash externally.
SELECT LOWER(HEX(MD5(name || age))) AS token
FROM Ages
ORDER BY token
LIMIT 1;
```

If your SQLite build **doesn't** include `md5()`, you can export to CSV and compute the MD5 with another tool.

---

## 7) Common troubleshooting

- **Error: `no such table: ages`** → Your table is named `Ages` (capital A). Either rename the query or the table to match exactly.
- **Inserted rows not showing:** Make sure you're connected to the correct database (e.g., run `SELECT DATABASE();` on MySQL or check the correct `.db` file in SQLite).
- **Character issues:** Ensure MySQL DB and client are using `utf8mb4`.

---

## 8) Clean export scripts (ready‑to‑run)

### MySQL quick script
```sql
-- mysql_ages.sql
CREATE DATABASE IF NOT EXISTS demo_db
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_0900_ai_ci;
USE demo_db;

DROP TABLE IF EXISTS Ages;
CREATE TABLE Ages (name VARCHAR(128), age INTEGER);

DELETE FROM Ages;
INSERT INTO Ages (name, age) VALUES ('Akam', 13);
INSERT INTO Ages (name, age) VALUES ('Oisin', 21);
INSERT INTO Ages (name, age) VALUES ('Mhirren', 34);
INSERT INTO Ages (name, age) VALUES ('Aleeshmah', 25);
INSERT INTO Ages (name, age) VALUES ('Nana', 33);
INSERT INTO Ages (name, age) VALUES ('Blythe', 28);

-- sanity checks
SELECT * FROM Ages ORDER BY name;
SELECT COUNT(*) AS rowcount FROM Ages;

-- optional hash (MySQL/MariaDB only)
SELECT HEX(MD5(CONCAT(name, age))) AS token
FROM Ages
ORDER BY token
LIMIT 1;
```

### SQLite quick script
```sql
-- sqlite_ages.sql
DROP TABLE IF EXISTS Ages;
CREATE TABLE Ages (name TEXT, age INTEGER);

DELETE FROM Ages;
INSERT INTO Ages (name, age) VALUES ('Akam', 13);
INSERT INTO Ages (name, age) VALUES ('Oisin', 21);
INSERT INTO Ages (name, age) VALUES ('Mhirren', 34);
INSERT INTO Ages (name, age) VALUES ('Aleeshmah', 25);
INSERT INTO Ages (name, age) VALUES ('Nana', 33);
INSERT INTO Ages (name, age) VALUES ('Blythe', 28);

-- sanity checks
SELECT * FROM Ages ORDER BY name;
SELECT COUNT(*) AS rowcount FROM Ages;

-- optional hash (only if md5() exists in your SQLite build)
-- SELECT LOWER(HEX(MD5(name || age))) AS token
-- FROM Ages
-- ORDER BY token
-- LIMIT 1;
```

---

## 9) Suggested GitHub layout

```
ages-table/
├─ README.md
├─ mysql_ages.sql
└─ sqlite_ages.sql
```

Commit these files and link the repo in your course submission if needed.
