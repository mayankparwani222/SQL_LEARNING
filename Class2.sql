-- To show all databases
show databases;

-- To use a perticular database
use sakila;

-- To check multiple values in same column we use in 
select * from actor where actor_id in (1,10,15);

-- % (wildcard character) : zero or more character
select * from actor where first_name like '%S'; #only last s data
select * from actor where first_name like 'S%T'; # s before t(at last)
select * from actor where first_name like '%S%'; # s anywhere in data

-- ( _ ) : exactly 1 character
select * from actor where first_name like 'A___';

select * from actor where first_name like 'A____%';

select * from actor where first_name like '_D%';

-- Practice questions

# 1. get actorid and firstname where the lastword should be te
select actor_id, first_name from actor where first_name like '%te';

# 2. get actorid and firstname where nn should be present in the middle
select actor_id, first_name from actor where first_name like '%_nn_%';

# 3. get first and last name where the last name column the first word b and the second last word r
select first_name, last_name from actor where last_name like 'b%r_';

# 4. get all the user info where the first name will have minimum 4 characters
select * from actor where first_name like '____%';

# 5. get all the columns where the actorid is from 2 to 90 and in first name s should be present in the middle and a should be the second last character
select * from actor where (actor_id between 2 and 90) and first_name like '_%s%a_';

-- operator
-- functions
-- inbuilt functions
-- scaler function (row function)     2) multi row functions
-- apply on each row and return the output for each row

-- char_length finds total character for each row
select first_name, char_length(first_name) from actor;

-- upper lower converts lower case and uppercase
select first_name, lower(first_name) from actor;

-- concat add to column rows
select first_name, concat(first_name, ' ok ', 'hello ' ) from actor;
select first_name, concat(first_name, last_name) from actor;
select first_name, concat(first_name, ' ', last_name) from actor;

-- concate_ws
select first_name, concat_ws('   ', 'Mr/Mrs', first_name, last_name) from actor;


-- substr(to extract some data) syntax;- substr(column name, starting index, total length)
select first_name, substr(first_name, 3) from actor;
select first_name, substr(first_name, -2) from actor;
select first_name, substr(first_name, -2, 1) from actor;

-- charlength and len
-- trim function:- trim and rtrim are use to trim string extra white spaces
select char_length('    Hey    ');
select char_length(trim('    Hey    '));
select char_length(rtrim('    Hey    ')); -- trims rightside spaces
-- locate
-- replace
select distinct year(payment_date) from payment;
select count(distinct customer_id) from payment where month(payment_date)='06';
select max(amount), avg(amount), (max(amount)-avg(amount)) from payment where year(payment_date) = 2006;

-- date function

-- aggregate function
