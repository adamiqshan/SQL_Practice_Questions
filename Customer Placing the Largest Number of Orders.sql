-- Customer Placing the Largest Number of Orders
-- https://leetcode.com/problems/customer-placing-the-largest-number-of-orders/

-- Write an SQL query to find the customer_number for the customer who has placed      the largest number of orders.

create table orders (
    order_number int,
    customer_number int
);

insert into orders values
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 3),
    (5, 2);


/*

select x.customer_number 
from (select customer_number, count(customer_number)
                            from orders
                            group by customer_number
                            order by 2 desc
                            limit 1) x


select customer_number
from orders
group by customer_number
order by count(customer_number) desc
limit 1

*/

-- Follow up: What if more than one customer has the largest number of orders, can     you find all the customer_number in this case?


select customer_number
from orders
group by customer_number
having count(order_number) >= (select count(customer_number)
                                from orders
                                group by customer_number
                                order by 1 desc
                                limit 1)