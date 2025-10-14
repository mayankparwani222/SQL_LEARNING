create database regex1;
use regex1;
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(100)
);

INSERT INTO Departments (DeptID, DeptName) VALUES
(1, 'Engineering'),
(2, 'Marketing'),
(3, 'HR');
select * from departments;


CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(100),
    Salary DECIMAL(10, 2),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

INSERT INTO Employees (EmpID, EmpName, Salary, DeptID) VALUES
(1, 'Alice', 70000, 1),
(2, 'Bob', 60000, 1),
(3, 'Charlie', 50000, 1),
(4, 'Diana', 55000, 2),
(5, 'Eve', 65000, 2),
(6, 'Frank', 40000, 3);
select * from Employees;

######## Corelated SubQuery ##############:-
-- type of subquery which is executed and dependent on outer query
-- nested query related on the result of outer query
-- we don't use correlated subquery much because it takes too much time to execute


-- get the name of employee who have the salary greater than the avg of the department
select e1.empid, e1.empname,e1.salary, e1.deptid 
from Employees as e1
where e1.salary > (Select avg(e2.salary) from Employees as e2 where e2.deptid = e1.deptid);

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100),
    Department VARCHAR(50)
);

INSERT INTO Students (StudentID, StudentName, Department) VALUES
(1, 'Alice', 'Computer Science'),
(2, 'Bob', 'Computer Science'),
(3, 'Charlie', 'Mathematics'),
(4, 'Diana', 'Mathematics'),
(5, 'Eve', 'Physics');


CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    Department VARCHAR(50)
);

INSERT INTO Courses (CourseID, CourseName, Department) VALUES
(101, 'Data Structures', 'Computer Science'),
(102, 'Algorithms', 'Computer Science'),
(201, 'Calculus', 'Mathematics'),
(202, 'Linear Algebra', 'Mathematics'),
(301, 'Quantum Mechanics', 'Physics');

select * from Students;
select *  from Courses;

--   last table

CREATE TABLE Enrollments (
    StudentID INT,
    CourseID INT,
    Grade DECIMAL(5, 2),
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Enrollments (StudentID, CourseID, Grade) VALUES
(1, 101, 88.5),
(1, 102, 92.0),
(2, 101, 76.0),
(2, 102, 81.5),
(3, 201, 85.0),
(3, 202, 90.0),
(4, 201, 78.0),
(4, 202, 82.5),
(5, 301, 91.0);

-- Students(StudentID, StudentName, Department), 
-- Courses (CourseID, CourseName, Department) and 
-- Enrollments (StudentID, CourseID, Grade)

-- find the name of student who have got higher grades than the average grades of all the students in the same course
select s.StudentID, s.StudentName, e.Grade, e.courseid
from Students as s 
inner join Enrollments as e on e.StudentID = s.StudentID
where e.grade > (select avg(grade) from Enrollments as i where i.courseid = e.courseid);

# Benefits of Exist keyword in subquery?
# Exist vs In operator?

-- Create products table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2)
);

-- Create sales table
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    quantity INT,
    sale_date DATE,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert data into products
INSERT INTO products (product_id, product_name, category, price) VALUES
(1, 'Laptop', 'Electronics', 1200.00),
(2, 'Phone', 'Electronics', 800.00),
(3, 'Chair', 'Furniture', 150.00),
(4, 'Desk', 'Furniture', 300.00),
(5, 'Monitor', 'Electronics', 250.00);

-- Insert data into sales
INSERT INTO sales (sale_id, product_id, quantity, sale_date) VALUES
(1, 1, 3, '2025-09-10'),
(2, 2, 5, '2025-09-11'),
(3, 1, 2, '2025-09-15'),
(4, 3, 7, '2025-09-1');

-- get all the product that had been sold 3 times in a single category
select p.product_id, p.product_name 
from products as p 
where p.product_id = (select product_id from sales as s where s.product_id = p.product_id and s.quantity > 3);

-- second highest price(salary)
select * from products where price = (select max(price) from products where price < (select max(price) from products));

-- get all the info from products, where the price is greater than price of product id = 3
select * from products where price > (select price from products where product_id = 3);
-- get all the info from products, where the category is same as of product id = 2
select * from products where category = (select category from products where product_id = 2);
-- get all the info from products, where the category is same as of product id = 2 or 3
select * from products where category in (select category from products where product_id = 2 or product_id = 3);
-- get all the info from products, where the price of the product is greater than among all the prices(max) of the product in furniture category
select * from products where price > (select max(price) from products where category = 'Furniture');
-- get pid,pname,and total quatity sold for each product
select p.product_id, p.product_name, sum(s.quantity) from products as p 
left join sales as s on s.product_id = p.product_id
group by product_id, product_name;