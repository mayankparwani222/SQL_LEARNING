create database test123;
use test123;
-- 1. customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    status VARCHAR(10) NOT NULL
);

INSERT INTO customers (customer_id, customer_name, status) VALUES
(1, 'Alice Johnson', 'Active'),
(2, 'Bob Smith', 'Active'),
(3, 'Carol White', 'Inactive'),
(4, 'David Lee', 'Active');

-- 2. orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO orders (order_id, customer_id, order_date, total_amount) VALUES
(101, 1, '2025-01-15', 250.00),
(102, 2, '2025-01-20', 180.00),
(103, 1, '2025-02-10', 300.00),
(104, 4, '2025-02-12', 150.00);

select month(order_date) as order_month, avg(total_amount) as avg_order_value from orders where year(order_date) = 2025 group by order_month;
select year(order_date) as order_year, month(order_date) as order_month, sum(total_amount) as monthly_revenue from orders where year(order_date) = 2025 group by order_year,order_month;

select c.customer_name, o.order_id, o.total_amount from customers as c left join orders as o on c.customer_id = o.customer_id;

select c.customer_name, o.order_id, o.order_date, o.total_amount from customers as c left join orders as o on c.customer_id = o.customer_id where c.status = 'Active';

select c.customer_name, o.order_id, o.total_amount from orders as o left join customers as c on o.customer_id = c.customer_id where month(o.order_date) = 2;

select c.customer_name, avg(o.total_amount) as avg_order_value from customers as c join orders as o on c.customer_id = o.customer_id group by c.customer_name;