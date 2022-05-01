-- Second Highest Salary
-- https://leetcode.com/problems/second-highest-salary/

-- Write an SQL query to report the second highest salary from the Employee table. If there is no second highest salary, the query should report null.

create table employee
(
    id int,
    salary int
);

insert into employee values
    (1, 100),
    (2, 200),
    (3, 300);

-- solution 1
select max(salary) SecondHighestSalary
from employee
where salary not in (select max(salary) from employee)

--soltion 2
select salary SecondHighestSalary
from employee
order by salary desc
limit 1 offset 1
