use sakila;

-- Group By
select customer_id, count(payment_id) from payment group by customer_id;

select customer_id, count(customer_id) from payment 
where customer_id>3 group by customer_id;

select customer_id, count(customer_id) from payment 
where count(customer_id)>30 group by customer_id; -- This will give error because
-- In case of filtering on aggregate function we use having function

-- filtering on aggregate function
select customer_id, count(customer_id) from payment 
group by customer_id having count(customer_id)>30;

--
select amount, count(*), sum(amount) from payment where amount > 2 group by amount;
select amount, count(*), sum(amount) from payment group by amount having count(*)>1000;
select amount, count(*), sum(amount) from payment group by amount having sum(amount)>5000;
-- as keyword is used to give alias name
select amount, count(*) as totalcount, sum(amount) from payment group by amount having totalcount > 1000;
select amount, amount+3 as newamount from payment;

describe payment;
-- get the staff id and the total no of customer serve by each staff
select staff_id, count(customer_id) from payment group by staff_id;

-- get the total amt and total no of payments done for each month 
select month(payment_date), sum(amount), count(amount) as total_payments from payment group by month(payment_date);

-- get the amount and total no of unique customer who have done the payment for each amount
select amount, count(distinct customer_id) from payment group by amount;

-- get the no of transaction achieved for each amount for the year 2005 where the number of transactions should be greater than 15
select count(amount) as total_payments, amount from payment where year(payment_Date)=2005 group by amount having total_payments > 15;


-- how much spent in each year
select sum(amount), year(payment_date) from payment group by year(payment_date);

select staff_id, year(payment_date), sum(amount) from payment group by staff_id, year(payment_date);