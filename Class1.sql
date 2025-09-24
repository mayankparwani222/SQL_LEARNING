#To show all databases
show databases;

#To use a perticular database
use sakila;

#To select all columns from a perticular table
select * from actor;

#To select perticular columns from a perticular table
select actor_id, first_name from actor;

#To know all the columns details of an Table
describe actor;

#To fetch required rows based on conditions 
select * from actor where first_name='Nick';
select * from actor where first_name='Nick' and actor_id=44;  # and operator
select * from actor where first_name='Nick' or actor_id=46;   # or operator
select * from actor where first_name='Nick' or actor_id!=44;  
select * from actor where actor_id>=2 and actor_id<=6;        # greater than and less than
select * from actor where actor_id<=2 or actor_id>=6;
select * from actor where actor_id between 2 and 6;           # between and not between operator
select * from actor where actor_id not between 2 and 6;

# Practice questions on actor table
#1 get first name and actor id where last name genius
select first_name, actor_id from actor where last_name='GENIUS';

#2 get actor_id and first_name where actor_id is from 3 to 18 or  the name should not be ED
select first_name, actor_id from actor where (actor_id between 3 and 18) or first_name !='ED';

#3 get last_name, actor_id, first_name where first_name = 'Nick' or 'Grace'
select last_name, first_name, actor_id from actor where first_name = 'NICK' or first_name = 'GRACE';

#4 get all columns where actor_id is from 2 to 6 or greater than 5. 
select * from actor where (actor_id between 2 and 6) or actor_id >5;