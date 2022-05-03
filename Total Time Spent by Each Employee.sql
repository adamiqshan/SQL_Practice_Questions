-- Find Total Time Spent by Each Employee
-- https://leetcode.com/problems/find-total-time-spent-by-each-employee/

-- Write an SQL query to calculate the total time in minutes spent by each employee     on each day at the office. Note that within one day, an employee can enter and        leave more than once.

create table employees
(
    emp_id      int,
    event_day   date,
    in_time     int,
    out_time    int
);

insert into employees values
 (1 , '2020-11-28', 4, 32),
 (1 , '2020-11-28', 55, 200),
 (1 , '2020-12-03', 1, 42),
 (2 , '2020-11-28', 3, 33),
 (2 , '2020-12-09', 47, 74);

select event_day as day, emp_id, sum(out_time - in_time) as total_time
from employees
group by event_day, emp_id;