-- Sales Person 
-- https://leetcode.com/problems/sales-person/

-- Write an SQL query to report the names of all the salespersons who did not have     any orders related to the company with the name "RED".

create table SalesPerson
(
    sales_id int,
    name varchar,
    salary int,
    commission_rate int,
    hire_date date
);

insert into SalesPerson values
(1,'John', 100000, 6,'4/1/2006'),
(2,'Amy ', 12000, 5,'5/1/2010'),
(3,'Mark', 65000, 12,'12/25/2008'),
(4,'Pam', 25000, 25,'1/1/2005'),
(5,'Alex', 5000, 10,'2/3/2007');

create table company
(
    com_id int,
    name varchar,
    city varchar
);

insert into Company values
(1, 'red', 'boston'),
(2, 'orange', 'new york'),
(3, 'yellow', 'boston'),
(4, 'green', 'austin');

create table orders
(
 order_id     int,
 order_date   date,
 com_id       int,
 sales_id     int,
 amount       int
);

insert into orders values
    (1, '1/1/2014', 3, 4, '10000'), 
    (2, '2/1/2014', 4, 5, '5000 '), 
    (3, '3/1/2014', 1, 1, '50000'), 
    (4, '4/1/2014', 1, 4, '25000');

select name from salesperson
where sales_id not in (select distinct sales_id from orders o
                        join company c on o.com_id = c.com_id
                        where c.name = 'red')