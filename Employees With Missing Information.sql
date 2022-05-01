-- Leetcode SQL problem 195
-- https://leetcode.com/problems/employees-with-missing-information/

create table employees  (
	employee_id INT,
	name  VARCHAR
);

create table salaries  (
	employee_id INT,
	salary  INT
);


insert into employees values
    (2, 'crew'),
    (4, 'haven'),
    (5, 'kristian');

insert into salaries values
    (5, 76071),
    (1, 22517),
    (4, 63539);

/*

--using where clause

select employee_id from employees
where employee_id not in (select employee_id from salaries)
union
select employee_id from salaries
where employee_id not in (select employee_id from employees )
order by employee_id asc

*/

--using joins (faster than the above solution)
    
select e.employee_id employee_id from employees e
left join salaries s on e.employee_id = s.employee_id
where s.salary is null
    union
select s.employee_id employee_id from salaries s
left join employees e on e.employee_id = s.employee_id
where e.name is null
order by employee_id asc