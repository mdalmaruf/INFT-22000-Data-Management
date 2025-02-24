# SQL Tutorial

## 1. Table Creation

To create tables in SQL, we use the `CREATE TABLE` statement. Below is an example of creating `employees` and `departments` tables with constraints.

### SQL Commands:

```sql
CREATE DATABASE TempDB;
USE TempDB;

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    salary DECIMAL(10, 2) CHECK (salary > 0),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);
```

### Expected Output:

```
Tables created successfully.
```

---

## 2. Data Insertion

To insert records into the tables, we use the `INSERT INTO` statement.

### SQL Commands:

```sql
INSERT INTO departments (dept_id, dept_name) VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance');

INSERT INTO employees (emp_id, emp_name, salary, dept_id) VALUES
(101, 'Alice Johnson', 60000, 1),
(102, 'Bob Smith', 75000, 2),
(103, 'Charlie Brown', 50000, 3);
```

### Expected Output:

```
3 rows inserted into departments.
3 rows inserted into employees.
```

---
![Table Constraints](Images/TableConstraints.png)

## 3. Table Constraints

### Constraints Used:

- **PRIMARY KEY**: Ensures unique identification of each row.
- **FOREIGN KEY**: Ensures referential integrity between tables.
- **UNIQUE**: Ensures no duplicate values in a column.
- **NOT NULL**: Ensures a column cannot have NULL values.
- **CHECK**: Ensures specified conditions are met.


Example Primary Key: Primary Key: Uniquely identifies each record.
```sql
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50)
);
```
Example Foreign Key: Links records between two tables.
```sql
CREATE TABLE enrollments (
    enroll_id INT PRIMARY KEY,
    student_id INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);
```
Example Composite Key: Combines multiple columns to uniquely identify a record.
```sql
CREATE TABLE orders (
    order_id INT,
    product_id INT,
    quantity INT,
    PRIMARY KEY (order_id, product_id)
);
```
Example Unique Key: Ensures no duplicate values in a column except for NULL values
```sql
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50) UNIQUE
);
```

Example constraint check:

```sql
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    salary DECIMAL(10, 2) CHECK (salary > 0), -- CHECK constraint to ensure salary is positive
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

-- Attempting to insert a negative salary (this should fail)
INSERT INTO employees (emp_id, emp_name, salary, dept_id) 
VALUES (104, 'David Lee', -45000, 1);
```

### Expected Output:

```
ERROR: Check constraint 'employees_chk_1' failed for column 'salary'
```

---

## 4. Aggregate Functions

SQL provides aggregate functions to perform calculations on data.

### SQL Commands:

```sql
SELECT dept_id, COUNT(*) AS total_employees, AVG(salary) AS avg_salary
FROM employees
GROUP BY dept_id;
```

### Expected Output:

```
 dept_id | total_employees | avg_salary
---------|----------------|------------
    1    |        1       |    60000   
    2    |        1       |    75000   
    3    |        1       |    50000   
```

---

## 5. SQL Joins

Joins allow us to retrieve data from multiple tables based on related columns.
![Table JOINS](Images/JOINS.png)
### SQL Commands:

#### INNER JOIN:

```sql
SELECT emp_name, salary, dept_name
FROM employees
INNER JOIN departments ON employees.dept_id = departments.dept_id;
```

#### LEFT JOIN:

```sql
SELECT emp_name, salary, dept_name
FROM employees
LEFT JOIN departments ON employees.dept_id = departments.dept_id;
```

### Expected Output:

```
 emp_name     | salary  | dept_name
--------------|---------|------------
 Alice Johnson| 60000   | HR         
 Bob Smith    | 75000   | IT         
 Charlie Brown| 50000   | Finance    
```

---


