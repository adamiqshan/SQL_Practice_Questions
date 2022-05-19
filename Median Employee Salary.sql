--Median Employee Salary

-- Write a SQL query to find the median salary of each company. Bonus points if you can solve it without using any built-in SQL functions.
    
create table employee(
    id int,
    company char,
    salary int
);

insert into employee values
(1, 'A', 2341),
(2, 'A', 341 ),
(3, 'A', 15 ),
(4, 'A', 15314),
(5, 'A', 451),
(6, 'A', 513),
(7, 'B', 15 ),
(8, 'B', 13 ),
(9, 'B', 1154),
(10, 'B', 1345),
(11, 'B', 1221),
(12, 'B', 234),
(13, 'C', 2345),
(14, 'C', 2645),
(15, 'C', 2645),
(16, 'C', 2652),
(17, 'C', 65  ),
(18, 'C', 650  );

select x.id, x.company, x.salary
from
    (
    select *,
    count() over (partition by company)/2.0 cnt,
    row_number() over (partition by company order by salary, id) rnum
    from employee
    ) x    
where rnum between cnt and cnt + 1;