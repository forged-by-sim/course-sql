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
