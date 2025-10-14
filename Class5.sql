###----------- Normalisation in sql -------------###
-- Technique to organise the data to remove duplicacy or data redendency
-- In this we try to convert the larger table into smaller tables
-- to achive normalisation we have many normal form:-

# 1. First Normal Form (1NF):
-- Each column must contain atomic (single) values.
-- Each record must be unique.

# 2. Second Normal Form (2NF):
-- Must be in 1NF.
-- All non-key attributes must be fully functionally dependent on the entire primary key (no partial dependencies).

# 3. Third Normal Form (3NF):
-- Must be in 2NF.
-- Eliminate transitive dependencies, meaning non-key attributes should not depend on other non-key attributes.

# 4. Boyce-Codd Normal Form (BCNF):
-- A stricter version of 3NF.
-- For every functional dependency A -> B, A must be a superkey.


-- foreign key establish relationship with the primary or unique key of another table

-- Create a Database:- 
create database Mayank;
use Mayank;
create table product(pid  int,  pname  varchar(20), price int);
insert into product values(100,'iphone',4000), (101,'mi tv', 3000),
(102,'fridge',5000), (103,'cover',500);


create table orders( orderid int, city varchar(20), productid int);
insert into orders values(994,'jaipur', 100),(995,'goa',102), (996,'J&K', 100), (997,'japan',102),
(998,'bhutan', 110);

select * from product;
select * from orders;

CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50)
);

CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseName VARCHAR(50),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
);


INSERT INTO Student (StudentID, StudentName) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'David'),
(5, 'Eva'),
(6, 'Frank'),
(7, 'Grace'),
(8, 'Helen'),
(9, 'Ian'),
(10, 'Jack');


INSERT INTO Enrollment (EnrollmentID, StudentID, CourseName) VALUES
(101, 1, 'Math'),
(102, 2, 'Physics'),
(103, 3, 'Chemistry'),
(104, 1, 'English'),
(105, 5, 'Biology'),
(106, 7, 'History'),
(107, 10, 'Math');


# Join Enrolmentid is null
select s.StudentId, s.StudentName, e.EnrollmentId, e.CourseName from student as s
left join enrollment as e on s.StudentId = e.StudentId 
where EnrollmentId is null;

select s.StudentId, count(e.enrollmentid) from student as s
left join enrollment as e on s.StudentId = e.StudentId
group by studentid;

select e.coursename, count(s.studentid), count(e.coursename) from student as s
inner join enrollment as e on s.studentid = e.studentid
group by coursename;

-- when we join a table with itself its know as self join
select s.studentid, e.studentid from student as s
inner join student as e on s.studentid = e.studentid;



create database  regex123;
use regex123;
create table product(pid  int,  pname  varchar(20), price int);
insert into product values(100,'iphone',4000), (101,'mi tv', 3000),
(102,'fridge',5000), (103,'cover',500);


create table orders( orderid int, city varchar(20), productid int);
insert into orders values(994,'jaipur', 100),(995,'goa',102), (996,'J&K', 100), (997,'japan',102),
(998,'bhutan', 110);

-- cross join or cartesian join
-- each row of 1st table is combined with each row of another table (m*n)
select p.pid, p.price, o.productid, o.city from product as p
cross join orders as o;

-- natural join
-- it is a kind of join which works on common name of column

use sakila;
show tables;
select a.actor_id, concat(a.first_name,' ',a.last_name) as actor_name, fa.actor_id as film_actor, fa.film_id, f.film_id as film, f.title from actor as a
join film_actor as fa join film as f
on a.actor_id = fa.actor_id and fa.film_id = f.film_id
order by actor_name;