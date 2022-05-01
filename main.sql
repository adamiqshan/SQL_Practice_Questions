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
