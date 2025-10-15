###########--------------- Constraints ---------------#########
 
# SQL constraints are rules applied to columns or tables within a database to enforce 
# data integrity and ensure the accuracy and reliability of the stored information. 
# They define limitations on the data that can be inserted, updated, or deleted.

-- 1. Not Null :- Ensures that a column cannot contain NULL values, 
#                 meaning a value must always be provided for that column.
CREATE TABLE Employees (
	EmployeeID INT NOT NULL
);
    
-- 2. UNIQUE: Guarantees that all values in a specific column  (or a set of columns)
#             are distinct, preventing duplicate entries.
CREATE TABLE Employees (
	Email VARCHAR(255) UNIQUE
); 

-- 3. DEFAULT: Assigns a default value to a column when no explicit value is provided
#              during an INSERT operation.
CREATE TABLE Products (
	ProductID INT PRIMARY KEY,
	Status VARCHAR(50) DEFAULT 'Available'
);

-- 4. CHECK: Enforces a specific condition that all values in a column must satisfy. 
#             It allows for defining custom rules for data validity.
CREATE TABLE Products (
	ProductID INT PRIMARY KEY,
	Price DECIMAL(10, 2) CHECK (Price > 0)
);

-- better approch to check if there are multiple constraints
create table test(id int check(id>5), gender varchar(20),
constraint db_test_gender_chk check(gender in ('Male','Female')));  -- check

-- 5. PRIMARY KEY: Uniquely identifies each row in a table. It is a
#                  combination of NOT NULL and UNIQUE constraints and is crucial
#                  for efficient data retrieval and establishing relationships.
CREATE TABLE Employees (
	EmployeeID INT PRIMARY KEY
);

-- 6. FOREIGN KEY: Establishes a link between two tables by referencing the primary key of another table. 
#                  It enforces referential integrity, ensuring that relationships between tables remain consistent.
CREATE TABLE Orders (
	OrderID INT PRIMARY KEY,
	EmployeeID INT,
	FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- create department , depmid unique, dname check constraint(should be biology and pysics)
-- (10,null),(biology, physics)
create table Department(
DeptID INT UNIQUE,
Deptname varchar(20) check (Deptname in ('Biology','Physics'))
);
INSERT INTO Department (DeptID, Deptname) VALUES (1, 'Biology');
INSERT INTO Department (DeptID, Deptname) VALUES (null, 'Physics');
select * from Department;