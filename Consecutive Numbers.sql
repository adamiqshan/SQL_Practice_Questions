-- Consecutive Numbers
/*
Write an SQL query to find all numbers that appear at least three times
consecutively.
*/

create table logs(
    id int,
    num int
);

insert into logs values 
    (1, 1),
    (2, 1),
    (3, 1),
    (4, 2),
    (5, 3),
    (6, 2),
    (7, 2),
    (8, 2),
    (9, 0),
    (10, 0),
    (11, 0);

/*

-- solution 1

select distinct ranks from (
    select *, case 
    when num == lag(num) over() & lag(num,2) over()
    then num
    end as ranks
    from logs
)
where ranks is not null
*/

-- solution 2

select a.num
from logs a
join logs b
on a.id = b.id+1 and a.num = b.num
join logs c
on a.id = c.id+2 and a.num = c.num;