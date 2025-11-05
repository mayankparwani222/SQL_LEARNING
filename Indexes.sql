# -----> Indexes  <----- #

-- An index in MySQL is a data structure (similar to the index of a book) 
-- that helps MySQL find data faster without scanning the entire table.

-- There are mainly two types of index
# 1). Clustered Index --> 
/*
A clustered index determines the physical order of data stored in the table.
1. In MySQL (InnoDB), the Primary Key is automatically the Clustered Index.
2. The table's rows are stored on disk in the order of the primary key.
3. There can be only ONE clustered index in a table.
*/
# 2). Unclustered Index -->
/*
A non-clustered index is a separate index structure that points to the clustered index (not directly to data).
1). These are also called Secondary Indexes.
2). You can have multiple non-clustered indexes.
3). The index stores a reference to the primary key, not the actual row.
*/

use mayank;

Create table students (
student_id INT,
name VARCHAR(50),
age INT
);
INSERT INTO students (student_id,name,age) VALUES
(3,'Alice',20),
(5,'Alaska',21),
(4,'Altu',22),
(2,'John',23),
(1,'Rony',24);

-- drop table students; 

explain select * from students where student_id=2;
ALTER TABLE students ADD PRIMARY KEY (student_id);
explain select * from students where student_id=2;  -- use of index

explain select * from students where name = 'Bob'; -- no index use

create index idx_student on students(student_id); -- index created (non - clustered)
show indexes from students;

create index idx_student_c on students(student_id, name);  -- composite index created (non-clustered index)
explain select * from students where name = 'Bob'; -- order matters in composite index
explain select * from students where student_id = 3 and name = 'Bob';

explain select * from students where name like 'Al%';
create index index_student_c on students(name(3)); -- partial index

explain select * from students where name like 'Alice';