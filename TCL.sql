-- TCL - Transactional control statement
/*
transaction start
ddl, dml
transaction end

1. autocommit => disable / write ( start transaction )
2.
3. end (commit,  )
*/

create table xyz (id int , name varchar(20));
insert into xyz values(11,'aman'),(12,'user');
select * from xyz;

start transaction;
insert into xyz values(99,'Tushar');
commit; -- save the transaction


start transaction;
SET sql_safe_updates = 0; -- (Command to allow multiple row changes)
delete from xyz;
insert into xyz values(99,'Tushar');
rollback;  -- reverts the changes


select * from xyz;

start transaction;
SET sql_safe_updates = 0; -- (Command to allow multiple row changes)
delete from xyz;
savepoint mayank;
insert into xyz values(99,'Tushar');
rollback to mayank;  -- reverts the changes till mayank


-- Recursive CTE
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    manager_id INT NULL,
    department VARCHAR(50),
    salary DECIMAL(10,2),
    FOREIGN KEY (manager_id) REFERENCES employees(emp_id)
);
INSERT INTO employees (emp_id, emp_name, manager_id, department, salary)
VALUES
(1, 'Alice', NULL, 'HR', 80000.00),    -- Top-level manager
(2, 'Bob', 1, 'HR', 60000.00),         -- Reports to Alice
(3, 'Carol', 1, 'IT', 70000.00),       -- Reports to Alice
(4, 'David', 2, 'HR', 50000.00),       -- Reports to Bob
(5, 'Emma', 3, 'IT', 55000.00),        -- Reports to Carol
(6, 'Frank', 3, 'IT', 52000.00),       -- Reports to Carol
(7, 'Grace', 2, 'HR', 48000.00);       -- Reports to Bob
;

WITH RECURSIVE cte AS (
    SELECT
        emp_id,
        emp_name,
        manager_id,
        emp_name AS hierarchy
    FROM employees
    WHERE manager_id IS NULL

    UNION ALL

    SELECT
        e.emp_id,
        e.emp_name,
        e.manager_id,
        CONCAT(h.hierarchy, ' → ', e.emp_name)
    FROM employees e
    JOIN cte h ON e.manager_id = h.emp_id
)
SELECT emp_name, hierarchy
FROM cte
ORDER BY emp_id;
