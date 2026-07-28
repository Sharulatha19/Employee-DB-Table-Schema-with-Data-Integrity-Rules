-- =====================================================================
-- Employee Database — DDL Commands, Constraints, Joins & Analytical Queries
-- =====================================================================

-- PART A: DDL COMMANDS
DROP DATABASE IF EXISTS employee;
CREATE DATABASE employee;
USE employee;

CREATE TABLE Departments (
    department_id   INT PRIMARY KEY,
    department_name VARCHAR(100)
);

CREATE TABLE Location (
    location_id   INT PRIMARY KEY,
    location_name VARCHAR(100)
);

CREATE TABLE Employees (
    employee_id   INT PRIMARY KEY,
    Employee_name VARCHAR(50),
    Gender        CHAR(1),
    Age           INT,
    Hire_date     DATE,
    Designation   VARCHAR(50),
    Salary        DECIMAL(10,2),
    department_id INT,
    location_id   INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id),
    FOREIGN KEY (location_id)   REFERENCES Location(location_id)
);

ALTER TABLE Employees ADD COLUMN email VARCHAR(100);
ALTER TABLE Employees MODIFY COLUMN Designation VARCHAR(150);
ALTER TABLE Employees DROP COLUMN Age;
ALTER TABLE Employees RENAME COLUMN Hire_date TO date_of_joining;

RENAME TABLE Departments TO Departments_Info;
RENAME TABLE Location TO Locations;

TRUNCATE TABLE Employees;

DROP TABLE Employees;
DROP DATABASE employee;


-- PART B: CONSTRAINTS
DROP DATABASE IF EXISTS employee;
CREATE DATABASE employee;
USE employee;

CREATE TABLE Departments (
    department_id   INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Locations (
    location_id   INT AUTO_INCREMENT PRIMARY KEY,
    location_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Employees (
    employee_id   INT PRIMARY KEY,
    Employee_name VARCHAR(50) NOT NULL,
    Gender        CHAR(1) CHECK (Gender IN ('M', 'F')),
    Age           INT CHECK (Age >= 18),
    Hire_date     DATE DEFAULT (CURRENT_DATE),
    Designation   VARCHAR(150),
    Salary        DECIMAL(10,2),
    email         VARCHAR(100) UNIQUE,
    department_id INT,
    location_id   INT,
    CONSTRAINT fk_employee_department
        FOREIGN KEY (department_id) REFERENCES Departments(department_id),
    CONSTRAINT fk_employee_location
        FOREIGN KEY (location_id) REFERENCES Locations(location_id)
);


-- SAMPLE DATA
INSERT INTO Departments (department_id, department_name) VALUES
(1, 'Human Resources'),
(2, 'Engineering'),
(3, 'Sales'),
(4, 'Finance');

INSERT INTO Locations (location_name) VALUES
('Bengaluru'),
('Mumbai'),
('Delhi');

INSERT INTO Employees
(employee_id, Employee_name, Gender, Age, Designation, Salary, email, department_id, location_id)
VALUES
(101, 'Riya Sharma',   'F', 28, 'Software Engineer',  65000.00, 'riya.sharma@company.com',    2, 1),
(102, 'Arjun Mehta',   'M', 34, 'HR Manager',          72000.00, 'arjun.mehta@company.com',    1, 3),
(103, 'Kavya Reddy',   'F', 22, 'Sales Executive',     40000.00, 'kavya.reddy@company.com',    3, 2),
(104, 'Vikram Nair',   'M', 45, 'Finance Director',    95000.00, 'vikram.nair@company.com',    4, 1),
(105, 'Sneha Iyer',    'F', 30, 'Software Engineer',   68000.00, 'sneha.iyer@company.com',     2, 1),
(106, 'Rohan Gupta',   'M', 26, 'Sales Executive',     42000.00, 'rohan.gupta@company.com',    3, 3),
(107, 'Ananya Das',    'F', 39, 'HR Executive',        50000.00, 'ananya.das@company.com',     1, 2),
(108, 'Karan Malhotra','M', 29, 'Software Engineer',   70000.00, 'karan.malhotra@company.com', 2, 3);


-- JOINS
SELECT
    e.employee_id,
    e.Employee_name,
    d.department_name,
    l.location_name,
    e.Designation,
    e.Salary,
    e.email
FROM Employees e
INNER JOIN Departments d ON e.department_id = d.department_id
INNER JOIN Locations l   ON e.location_id   = l.location_id;

SELECT
    d.department_id,
    d.department_name,
    e.employee_id,
    e.Employee_name
FROM Departments d
LEFT JOIN Employees e ON d.department_id = e.department_id;

SELECT
    l.location_id,
    l.location_name,
    e.employee_id,
    e.Employee_name
FROM Locations l
LEFT JOIN Employees e ON l.location_id = e.location_id;


-- ANALYTICAL QUERIES
SELECT
    d.department_name,
    COUNT(e.employee_id) AS headcount,
    ROUND(AVG(e.Salary), 2) AS avg_salary
FROM Departments d
LEFT JOIN Employees e ON d.department_id = e.department_id
GROUP BY d.department_name
ORDER BY avg_salary DESC;

SELECT
    d.department_name,
    e.Employee_name,
    e.Salary
FROM Employees e
INNER JOIN Departments d ON e.department_id = d.department_id
WHERE e.Salary = (
    SELECT MAX(e2.Salary)
    FROM Employees e2
    WHERE e2.department_id = e.department_id
);

SELECT
    l.location_name,
    COUNT(e.employee_id) AS num_employees,
    SUM(e.Salary) AS total_salary_cost
FROM Locations l
LEFT JOIN Employees e ON l.location_id = e.location_id
GROUP BY l.location_name
ORDER BY total_salary_cost DESC;

SELECT
    d.department_name,
    e.Gender,
    COUNT(*) AS num_employees,
    ROUND(AVG(e.Age), 1) AS avg_age
FROM Employees e
INNER JOIN Departments d ON e.department_id = d.department_id
GROUP BY d.department_name, e.Gender
ORDER BY d.department_name, e.Gender;

SELECT
    d.department_name,
    ROUND(AVG(e.Salary), 2) AS dept_avg_salary
FROM Employees e
INNER JOIN Departments d ON e.department_id = d.department_id
GROUP BY d.department_name
HAVING AVG(e.Salary) > (SELECT AVG(Salary) FROM Employees);
