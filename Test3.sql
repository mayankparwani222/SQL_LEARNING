create database test;
use test;
CREATE TABLE Students (
    student_id INT PRIMARY KEY ,
    student_name VARCHAR(100) NOT NULL,
    city VARCHAR(100),
    enrollment_date DATE
);
CREATE TABLE Enrollments (
    enroll_id INT PRIMARY KEY,
    student_id INT,
    course_name VARCHAR(100),
    course_fee DECIMAL(10,2),
    grade CHAR(1),
    enroll_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);
INSERT INTO Students (student_id, student_name, city, enrollment_date) VALUES
(1,'Amit', 'Delhi', '2023-01-15'),
(2,'Sneha', 'Mumbai', '2023-02-10'),
(3,'Raj', 'Delhi', '2023-03-05'),
(4,'Priya', 'Banglore', '2023-01-25'),
(5,'Vikram', 'Mumbai', '2023-04-12'),
(6,'Anjali', 'Delhi', '2023-02-28'),
(7,'Karan', 'Hyderabad', '2023-03-20');

INSERT INTO Enrollments (enroll_id, student_id, course_name, course_fee, grade, enroll_date) VALUES
(101, 1, 'SQL Basics', 5000, 'A', '2023-01-20'),
(102, 1, 'Python', 6000, 'B', '2023-02-05'),
(103, 2, 'SQL Basics', 5000, 'B', '2023-02-12'),
(104, 2, 'Data Science', 10000, 'A', '2023-03-01'),
(105, 3, 'SQL Basics', 5000, 'C', '2023-03-07'),
(106, 4, 'Python', 6000, 'A', '2023-01-28'),
(107, 5, 'SQL Basics', 5000, 'B', '2023-04-15'),
(108, 6, 'Data Science', 10000, 'A', '2023-03-05'),
(109, 6, 'SQL Basics', 5000, 'A', '2023-03-12'),
(110, 7, 'Python', 6000, 'B', '2023-03-25');

-- 1
select course_name, count(distinct student_id) as total_students
from Enrollments
group by course_name
order by total_students desc;

-- 2
SELECT DISTINCT s.student_name
FROM Students s
JOIN Enrollments e 
  ON s.student_id = e.student_id
WHERE e.grade = 'A';

-- 3
SELECT 
    s.student_name,
    e.course_name,
    COUNT(e.course_name) OVER (PARTITION BY s.student_name) AS total_courses
FROM Students s
JOIN Enrollments e 
  ON s.student_id = e.student_id;
  
-- 4
SELECT DISTINCT s.student_name
FROM Students s
JOIN Enrollments e 
  ON s.student_id = e.student_id
WHERE e.course_fee = (SELECT MAX(course_fee) FROM Enrollments);

-- 5
SELECT s.student_name
FROM Students s
JOIN Enrollments e 
  ON s.student_id = e.student_id
GROUP BY s.student_name
HAVING MIN(e.course_fee) >= 6000;

-- 6
SELECT s.student_name, e.course_name
FROM Students s
JOIN Enrollments e 
  ON s.student_id = e.student_id
WHERE e.course_fee = (SELECT MIN(course_fee) FROM Enrollments);


-- 7
SELECT s.city,
    s.student_name,
    e.course_name,
    e.course_fee,
    dense_rank() OVER (Partition BY s.city order by course_fee desc) AS rank_in_city
FROM Students s
JOIN Enrollments e 
  ON s.student_id = e.student_id;