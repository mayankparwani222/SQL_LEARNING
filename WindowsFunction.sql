-- group by revision
# Homework

-- Windows function
/*
A window function performs a calculation across a set of table rows that 
are related to the current row, without grouping the rows into a single output.
They’re similar to aggregate functions (like SUM() or AVG()), 
but you still see all individual rows.
function_name(expression) OVER (
    [PARTITION BY column_name]
    [ORDER BY column_name]
    [frame_clause]
)
*/
-- Windows function and group by function
/*
| Feature               | `GROUP BY`                     | `WINDOW FUNCTION (OVER)`                      |
| --------------------- | ------------------------------ | --------------------------------------------- |
| **Purpose**           | Aggregates data (reduces rows) | Adds aggregate info **without reducing rows** |
| **Output Rows**       | Fewer rows — one per group     | Keeps all original rows                       |
| **Use Case**          | Summaries                      | Per-row insights / comparisons                |
| **Clause**            | `GROUP BY`                     | `OVER (PARTITION BY ... ORDER BY ...)`        |
| **Can use in WHERE?** | No (use HAVING instead)        | Yes (can be used in SELECT or ORDER BY)       |
*/
-- over in windows function
/*
The OVER() clause defines the “window” — the set of rows that each calculation should consider for a given row.
*/
use regex1;
CREATE TABLE EmployeeSales (
    EmployeeID INT,
    EmployeeName VARCHAR(100),
    Department VARCHAR(50),
    SaleDate DATE,
    SaleAmount DECIMAL(10, 2)
);


INSERT INTO EmployeeSales (EmployeeID, EmployeeName, Department, SaleDate, SaleAmount) VALUES
(1, 'Alice', 'Sales', '2025-06-01', 1200.00),
(1, 'Alice', 'Sales', '2025-06-03', 1800.00),
(1, 'Alice', 'Sales', '2025-06-07', 1500.00),
(2, 'Bob', 'Sales', '2025-06-01', 2000.00),
(2, 'Bob', 'Sales', '2025-06-05', 2200.00),
(2, 'Bob', 'Sales', '2025-06-08', 2100.00),
(3, 'Carol', 'Marketing', '2025-06-02', 3000.00),
(3, 'Carol', 'Marketing', '2025-06-06', 2800.00),
(3, 'Carol', 'Marketing', '2025-06-10', 2700.00),
(4, 'Dave', 'Marketing', '2025-06-01', 1000.00),
(4, 'Dave', 'Marketing', '2025-06-03', 1100.00),
(4, 'Dave', 'Marketing', '2025-06-09', 1300.00),
(5, 'Eve', 'HR', '2025-06-04', 900.00),
(5, 'Eve', 'HR', '2025-06-07', 950.00),
(5, 'Eve', 'HR', '2025-06-10', 1000.00),
(6, 'Frank', 'Sales', '2025-06-02', 1700.00),
(6, 'Frank', 'Sales', '2025-06-05', 1900.00),
(6, 'Frank', 'Sales', '2025-06-09', 1600.00),
(7, 'Grace', 'Finance', '2025-06-01', 2500.00),
(7, 'Grace', 'Finance', '2025-06-06', 2400.00),
(7, 'Grace', 'Finance', '2025-06-10', 2600.00),
(8, 'Hank', 'Finance', '2025-06-03', 2300.00),
(8, 'Hank', 'Finance', '2025-06-04', 2200.00),
(8, 'Hank', 'Finance', '2025-06-08', 2100.00),
(9, 'Ivy', 'HR', '2025-06-02', 800.00),
(9, 'Ivy', 'HR', '2025-06-06', 850.00),
(9, 'Ivy', 'HR', '2025-06-09', 950.00),
(10, 'Jake', 'IT', '2025-06-05', 3000.00),
(10, 'Jake', 'IT', '2025-06-07', 3200.00),
(10, 'Jake', 'IT', '2025-06-10', 3100.00);

select * from employeeSales;

-- over ()
select *, sum(SaleAmount) over() from employeeSales;

-- over(Partition on)
select *, sum(SaleAmount) over(Partition BY EmployeeName) from employeeSales;

-- OVER (Order BY) -- running sum or cummilative sum 
select *, sum(SaleAmount) over(Order BY SaleAmount) from employeeSales;
select *, avg(SaleAmount) over(Order BY SaleAmount) from employeeSales; -- running average

-- Over (Partition by order by)
 select *, sum(SaleAmount) over(Partition BY EmployeeName Order by SaleAmount) from employeeSales;
 
 create database window_test;

use window_test;

CREATE TABLE employee_sales (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    sale_amount DECIMAL(10,2),
    sale_date DATE
);

-- 2. Insert at least 20 sample records
INSERT INTO employee_sales (emp_name, department, sale_amount, sale_date) VALUES
('Alice', 'Electronics', 1200.00, '2025-01-10'),
('Bob', 'Electronics', 950.00, '2025-01-12'),
('Charlie', 'Furniture', 2100.00, '2025-01-15'),
('David', 'Furniture', 1800.00, '2025-01-18'),
('Ella', 'Clothing', 400.00, '2025-01-20'),
('Frank', 'Clothing', 750.00, '2025-01-22'),
('Grace', 'Clothing', 600.00, '2025-01-23'),
('Henry', 'Electronics', 1300.00, '2025-01-24'),
('Isabella', 'Furniture', 2500.00, '2025-01-25'),
('Jack', 'Clothing', 900.00, '2025-01-26'),
('Karen', 'Electronics', 1450.00, '2025-01-28'),
('Leo', 'Furniture', 1900.00, '2025-01-29'),
('Mona', 'Clothing', 500.00, '2025-01-30'),
('Nate', 'Electronics', 1600.00, '2025-02-01'),
('Olivia', 'Clothing', 800.00, '2025-02-02'),
('Peter', 'Furniture', 1700.00, '2025-02-03'),
('Quinn', 'Electronics', 1250.00, '2025-02-04'),
('Rose', 'Clothing', 1000.00, '2025-02-05'),
('Steve', 'Furniture', 2200.00, '2025-02-06'),
('Tina', 'Electronics', 1800.00, '2025-02-07');

-- row_number() gives numbers column for each row
select *, sum(sale_amount) over (partition by department order by sale_amount),
row_number() over(partition by department) from employee_sales;
select * from employee_sales;

update employee_sales set sale_amount = 500 where emp_id =7;

-- rank() gives ranking column for each row
select *, row_number() over (partition by department order by sale_amount),
rank() over(partition by department order by sale_amount) from employee_sales;

select *, row_number() over (partition by department order by sale_amount),
rank() over(partition by department order by sale_amount),
dense_rank() over(partition by department order by sale_amount) from employee_sales;

-- rank function skips the rankings where there are multiple rows 
-- with same rank but dense rank doesnt skip

-- lag and lead
/*
LAG(column_name, offset, default_value) OVER (
    [PARTITION BY column_name]
    [ORDER BY column_name]
)
SELECT
    salesperson,
    sale_date,
    amount,
    LAG(amount, 1) OVER (PARTITION BY salesperson ORDER BY sale_date) AS previous_amount
FROM sales;
*/
select *,
LAG(sale_amount, 1, 0) over(
partition by department 
order by sale_amount) as previous_amount
from employee_sales;

select *,
LEAD(sale_amount, 1, 0) over(
partition by department 
order by sale_amount) as previous_amount
from employee_sales;

-- ntile :- Divides in 4 parts

-- selecting nth rank from a table
select * from 
(select *, dense_rank() over(order by sale_amount desc) as ranking from employee_sales) as abc
where abc.ranking = 4;