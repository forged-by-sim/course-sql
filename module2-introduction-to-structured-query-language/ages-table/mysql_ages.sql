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
