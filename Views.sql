##############  Views  ###################
-- Views are virtual table used to store data

use sakila;

select first_name, film_id from actor join film_actor where actor.actor_id = film_actor.actor_id;

-- complex query view
create view v_actor as
select first_name, film_id from actor join film_actor where actor.actor_id = film_actor.actor_id;

select * from v_actor;
-- view for specific column (security)
create view v_first as
select first_name from actor;

select * from v_first;


-- ctas (create table as select)
create table yash10 as 
select * from actor where actor_id between 2 and 5;

select * from yash10;

create view v_yash as    -- updatable
select actor_id, first_name from yash10;

select * from v_yash;

update v_yash set first_name = 'xyz';

-- what is the difference b/w materialize view and non-materialise view?

-- set SQL_SAFE_UPDATES = 0;
-- views simplify complex query
-- views can restrict users (security)
-- data consistency
