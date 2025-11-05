-- CTE :- Common Table Expression
/*
A CTE (Common Table Expression) is a temporary result set that you can reference within a SELECT, INSERT, UPDATE, or DELETE statement.
It makes your SQL code:
1. Easier to read
2. Easier to debug
3. Reusable inside one query
*/

-- How to create cte and its features

use sakila;
select * from actor;
select * from film_actor;

select actor.actor_id, film_id from actor join film_actor on actor.actor_id = film_actor.actor_id and actor.actor_id = 1;

select actor.actor_id, film_id 
from actor 
join (select * from film_actor where actor_id =1) as film_actor 
on actor.actor_id = film_actor.actor_id;

with film_cte as 
(select * from film_actor where actor_id =1
)
select actor.actor_id, film_id from actor join film_cte on actor.actor_id = film_cte.actor_id;

-- Set Operation:-

-- Union Set operation
-- for this number of columns should be same doesnt matter its order
select actor_id, first_name, last_update from actor where actor_id<=3
union all
select first_name, last_update, actor_id from actor where actor_id between 4 and 6;


-- Recursive CTE :-
/*
A recursive CTE is a CTE that calls itself to repeatedly process data until a condition is met.
It has two parts:
1. Anchor member → the starting point (base case)
2. Recursive member → the rule that calls the CTE again

Basic Syntex :-

WITH RECURSIVE cte_name AS (
    -- 1️. Anchor member
    SELECT ... 

    UNION ALL

    -- 2️. Recursive member
    SELECT ...
    FROM cte_name
    JOIN other_table ...
)
SELECT * FROM cte_name;

*/

-- create series of numbers 1 to 10
with recursive cte as (
select 1 as num    -- base case
union all
select num+1 from cte 
where num <10)     -- end case

select * from cte;