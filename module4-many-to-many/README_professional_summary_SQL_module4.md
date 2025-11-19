# 🔁 Module 4: Many-to-Many Relationships & JSON Export

**Course:** Introduction to Structured Query Language (SQL)  
**Platform:** Coursera – University of Michigan  
**Instructor:** Dr. Charles Severance  
**Module Folder:** `module4-many-to-many/json-files`

⸻

## 🎯 Objective

This final module tackled one of the most important database design patterns: many-to-many relationships. We also practiced exporting structured query results into JSON — a key data format for web applications, APIs, and simulations.

The project simulated a class enrollment system, involving:
- Students
- Courses
- A join table for enrollments

The goal was to extract a cleaned, normalized list of enrollments and export it as a structured JSON document.

⸻

## 🧠 What I Learned

- How to define a **normalized schema** across three linked tables
- Using **foreign keys** to manage relationships across tables
- Writing **JOIN** queries to extract usable datasets
- Exporting SQL query results into **JSON format**
- Identifying **redundancy issues** in improperly joined outputs

⸻

## 🧪 Assignment Breakdown

📁 **Key Files:**
- `user.sql` – SQL file defining schema and performing the final JOIN query
- `roster.json` – Final exported JSON file
- `module4_assignment.txt` – Step-by-step breakdown
- `roster.txt` – Raw SQL output prior to JSON export

📸 **Screenshots:**
- `QueryResult.png` – Visual proof of query output
- `JSON_Export_Instructions.png` – Assignment prompt
- `Query_Breakdown_Steps1to3.png` – Conceptual flow of relational joins

⛓️ **Tables Used:**
- `User` – stores student names and IDs
- `Course` – stores course titles and IDs
- `Member` – join table linking `User` and `Course` with a `role` column

🧾 **Final Query (simplified):**
```sql
SELECT User.name, Course.title, Member.role
FROM User 
JOIN Member ON User.id = Member.user_id
JOIN Course ON Member.course_id = Course.id;


The exported results were formatted as a list of dictionaries in JSON, each representing a (user, course, role) tuple.

⸻

🔗 Relevance to Real-World Simulations

Many simulations — especially educational, medical, or defense — involve complex relationships between users, roles, and environments. Structuring these relationships through normalized schemas and exporting them into interoperable formats like JSON is essential.

This module pushed me to think like a backend architect:

How will this data be used later?

Is it redundant, malformed, or incomplete?

Can other systems parse it easily?

⸻

🧠 Reflection

This was my favorite and most challenging module. Debugging broken JOINs, interpreting JSON structure, and creating readable output made me feel like a backend developer.

It also closed the loop from Module 1’s setup to Module 4’s export: I went from installing SQLite to writing real-world compatible query pipelines.
