CREATE DATABASE school_db;
USE school_db;

#1️. Create students table and insert 2 rows
CREATE TABLE students (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT
);

INSERT INTO students (id, name, marks) VALUES
(1, 'Kaviya', 85),
(2, 'Arun', 75);

# 2.Create employees table and insert 2 rows
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary DECIMAL(10,2)
);

INSERT INTO employees (emp_id, emp_name, salary) VALUES
(101, 'Ravi', 8000),
(102, 'Meena', 9000);

# 4.UPDATE employees
SET salary = salary * 1.10
WHERE emp_id = 101;  -- or any emp_id you want to update
UPDATE employees
SET salary = salary * 1.10
WHERE emp_id = 101;  -- or any emp_id you want to update
select * from employees;
..
# 3.Create products table and insert 3 rows
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL(10,2)
);
INSERT INTO products (product_id, product_name, price) VALUES
(1, 'Laptop', 600),
(2, 'Mouse', 200),
(3, 'Keyboard', 400);

# 5.Delete a product where price > 500
SET SQL_SAFE_UPDATES = 0;
DELETE FROM products
WHERE price > 500;
SET SQL_SAFE_UPDATES = 1;
DELETE FROM products
WHERE price > 500
LIMIT 10;  


#6.Delete a product where price > 500

SELECT * FROM students
WHERE marks > 80;

# 7.Recursive CTE to increase salary by 1000 until it reaches 10,000
WITH RECURSIVE salary_increase AS (
    SELECT emp_id, emp_name, salary
    FROM employees
    WHERE salary < 10000
    UNION ALL
    SELECT emp_id, emp_name, salary + 1000
    FROM salary_increase
    WHERE salary + 1000 <= 10000
)
SELECT * FROM salary_increase;

# 8.Rename table employees to staff_members
ALTER TABLE employees
RENAME TO staff_members;

#9.Add a new column remarks to the students table

ALTER TABLE students
ADD COLUMN remarks VARCHAR(100);

# 10.Create a backup table students_backup with all rows from students
CREATE TABLE students_backup AS
SELECT * FROM students;

