#### Subquery ####

-- A subquery in SQL, also known as an inner or nested query, is a complete query embedded within another SQL statement.
-- It is enclosed in parentheses and its results are used by the outer query.

# Uses of Subqueries :-
-- 1. Filtering: selecting rows based on conditions from another query.
-- 2. Aggregating: applying functions like SUM, COUNT, AVG with dynamic conditions.
-- 3. Updating: modifying data using values from other tables.
-- 4. Deleting: removing rows based on criteria from another query.

use sakila;
select * from actor where first_name = (select first_name from actor where actor_id=3);

select * from payment;
select * from payment where amount = (select amount from payment where payment_id=3);

-- get the payment id , amount and payment date where the amount of rental id 1476 is same
select payment_id, amount, payment_date from payment where amount = (select amount from payment where rental_id = 1476);

-- get the payment id , amount and payment date where the month of table is the month of payent id 4
select payment_id, amount, payment_date from payment where month(payment_date) = (select month(payment_date) from payment where payment_id = 4);

-- we can use =, >, <=, >= , < when its scaler subquery
-- scaler subquery when it returns only one row

-- get the payment id and amount from table payment where the amount = max amount of the table;
select payment_id, amount from payment where amount = (select max(amount) from payment);

-- we cannot use =, >, <=, >= , < when its not scaler subquery i.e multirow subquery
-- 1. we use in operator IN operator in multiroq subquery :-
select payment_id, amount from payment where amount in (select amount from payment where payment_id = 5 or payment_id = 6);

-- we can use any operator also (works for =, <, >, >=, <=, !=):- 
select payment_id, amount from payment where amount = any (select amount from payment where payment_id = 5 or payment_id = 6);
select payment_id, amount from payment where amount > any (select amount from payment where payment_id = 5 or payment_id = 6);

-- we can use all operator as well (works for >, <, <=, >=, !=):-
select payment_id, amount from payment where amount <= all (select amount from payment where payment_id = 5 or payment_id = 6);
select payment_id, amount from payment where amount != all (select amount from payment where payment_id = 5 or payment_id = 6);