# Employees Database with SQL Constraints

## 📘 Project Overview
- To create a relational database for managing employee information.
- To apply SQL DDL commands and constraints that enforce rules and prevent invalid data.
- To demonstrate the importance of schema design in real-world applications.

---

## 🗂️ Description
The Employees Database is built using SQL Data Definition Language (DDL) commands.
It includes three main tables:
- **Departments** → Stores department details.
- **Locations** → Stores office location details.
- **Employees** → Stores employee records with references to departments and locations.

---

## 🎯 Objectives
- Create tables for **Employees**, **Departments**, and **Locations**.
- Practice the five core DDL commands: `CREATE`, `ALTER`, `RENAME`, `TRUNCATE`, `DROP`.
- Apply constraints such as:
  - `PRIMARY KEY`
  - `FOREIGN KEY`
  - `NOT NULL`
  - `UNIQUE`
  - `CHECK`
  - `DEFAULT`
- Insert sample data and test constraints with valid and invalid inputs.
- Explore the data with `INNER JOIN` / `LEFT JOIN` and analytical queries.

---

## 🗂️ Database

Constraints such as **PRIMARY KEY, FOREIGN KEY, NOT NULL, UNIQUE, CHECK, DEFAULT** are applied to enforce rules like:
- Each employee must have a unique ID.
- Age must be 18 or above.
- Gender must be restricted to 'M' or 'F'.
- Hire date defaults to the current date if not specified.
- Department and location names must be unique and not null.
- Email addresses must be unique.

---

## 🔍 Constraints Used
- **PRIMARY KEY** → Ensures unique identification of records.
- **FOREIGN KEY** → Establishes relationships between tables.
- **NOT NULL** → Prevents empty values in important fields.
- **UNIQUE** → Ensures no duplicate values in a column.
- **CHECK** → Restricts values based on conditions (e.g., age ≥ 18, gender in M/F).
- **DEFAULT** → Automatically assigns values (e.g., current date for `Hire_date`).

---

## ✅ Importance of Tables
- Organize data in a structured format.
- Maintain relationships between entities (employees, departments, locations).
- Enforce business rules through constraints.
- Enable efficient querying and reporting.
- Ensure scalability and maintainability of the database.

---

## 📊 Testing
- Inserted sample data to validate constraints.
- Invalid entries (invalid gender, age below 18, duplicate department id) were rejected —
  see the constraint-enforcement tests in `Sharu_Employee_DB_Screenshots.pdf`.
- Hire date was automatically assigned when not specified.

---

## Files in this project

| File | Purpose |
|---|---|
| `Employee_DB_Assignment.sql` | Part A (DDL practice) + Part B (final schema recreated with constraints) |
| `Employee_DB_Queries.sql` | Sample data + joins + 5 analytical queries (run **after** `Employee_DB_Assignment.sql`) |
| `Sharu_Employee_DB_Screenshots.pdf` | Execution screenshots — SQL editor + Result Grid views generated from a real, live run of both scripts |
| `README.md` | This file |

## How to run

```bash
mysql -u root -p < Employee_DB_Assignment.sql
mysql -u root -p < Employee_DB_Queries.sql
```

Or paste the contents into MySQL Workbench / any MySQL client, in that order.

---

## 📘 Conclusion
- The Employees Database was successfully created with proper constraints.
- Constraints ensured **data integrity, accuracy, and reliability**.
- Relationships between tables were established using foreign keys.
- The project highlights how SQL schema design and constraints form the backbone of relational databases.

---

## 🛠️ Technologies Used
- **MySQL / MariaDB** (Database Management System)
- **SQL DDL Commands** (CREATE, ALTER, RENAME, TRUNCATE, DROP)

---

## 👩💻 Author
**Sharu Latha B**
Student pursuing AI-driven Data Analytics | Module 3 — MySQL Assignment 1 (DDL Commands & Constraints)

This project focuses on building an Employees Database using SQL Data Definition Language (DDL) commands. The database is designed to store and manage employee information in a structured way, ensuring data integrity and consistency through the use of constraints.
