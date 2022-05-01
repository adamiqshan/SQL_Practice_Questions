-- Customer Who Visited but Did Not Make Any Transactions
-- https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/

-- Write an SQL query to find the IDs of the users who visited without making any transactions and the number of times they made these types of visits.

create table visits(
    visit_id int,
    customer_id int
);

create table transactions(
    transaction_id int,
    visit_id int,
    amount int
);

insert into visits values
    (1, 23),
    (2, 9 ),
    (4, 30),
    (5, 54),
    (6, 96),
    (7, 54),
    (8, 54);

insert into transactions values
    (2, 5, 310),
    (3, 5, 300),
    (9, 5, 200),
    (12, 1, 910),
    (13, 2, 970);


select customer_id, count(1) count_no_trans from visits
where visit_id not in (select distinct visit_id from transactions)
group by customer_id