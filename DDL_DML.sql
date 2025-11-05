use regex1;

-- DDL and DML statments and operations
-- DDL (Data Defination Language) :-
-- DDL statements are used to define, modify, or delete database structures such as tables, schemas, and indexes. 
-- These statements affect the structure, not the data itself.
-- language : data defination, table

-- create :- creates an object
-- Creates database objects (tables, views, indexes, etc.)
create table t4(id int); -- create statement -- ddl operation

-- drop :- it used to drop the object 
-- Deletes a database object permanently
drop table t4; -- data and table structure both are deleted(we cannot undo it)


create table t5(id int);
desc t5;

-- alter :- it is used to change the structure of a table
-- Modifies an existing object (add/modify columns, etc.)
alter table t5 add column name varchar(50); -- ddt (table structure is changed) 
-- (basically to add or change columns)

desc t5;

-- delete column
alter table t5 drop column id;

desc t5;

select * from t5; -- first check table
alter table t5 add column eid int primary key; -- (add primary key column id)
desc t5;

-- DML :- Data Manipulation Language
-- (insert, update, delete, merge(not in mysql))

-- insert
insert into t5 values('yash',11),('Daksh',12);
select * from t5;

-- update
update t5 set name = 'Tushar'; -- (Throws error)
SET sql_safe_updates = 0; -- (Command to allow multiple row changes)
update t5 set name = 'Tushar'; -- (Changes done in all rows)
update t5 set name = 'Amit' where eid = 11; -- (Changes done in only specified row)
select * from t5;

-- delete
# delete from t5; --(never use this, it deletes complete table items)
-- always put condition for it
delete from t5 where eid=11;
select * from t5;
-- we can undo this delete operation whereas in drop we cannot undo it

-- truncate (DDL)
-- it firstly drop the table structure and then it recreates the structure back again
-- thats why it is a DDL operation
truncate table t5;
select * from t5;


-- delete vs truncate vs drop

-- create a column name as email varchar
create table t6(email varchar(100)); 
-- add a column name as rollno. before the email column
alter table t6
add column rollno int
first;
-- add a primary key to this roll number
ALTER TABLE t6
ADD PRIMARY KEY (rollno);
-- add a unique key to the email column
ALTER TABLE t6
ADD UNIQUE KEY (email);
-- insert 2 rows into both the columns
insert into t6 values(1, 'abc@gmail.com'),(2, 'xyz@gmail.com');

select * from t6;
-- add a new column into the table name as phoneno. with the datatype as varchar
ALTER TABLE t6
ADD COLUMN phoneno varchar(10);

select * from t6;
-- update any phone number to have the characters abc 
update t6 set phoneno = '7792940abc';

select * from t6;
-- (try to change the datatype of phone number from varchar to integer)
ALTER TABLE t6
MODIFY COLUMN phoneno int;

