create table users
(
user_id int primary key,
user_name varchar(30) not null,
email varchar(50));

insert into users values
(1, 'Sumit', 'sumit@gmail.com'),
(2, 'Reshma', 'reshma@gmail.com'),
(3, 'Farhana', 'farhana@gmail.com'),
(6, 'Sumit', 'sumit007@gmail.com'),
(4, 'Robin', 'robin@gmail.com'),
(5, 'Robin', 'robin@gmail.com');

insert into users values
(1, 'Sumit', 'sumit@gmail.com'),
(2, 'Reshma', 'reshma@gmail.com'),
(3, 'Farhana', 'farhana@gmail.com'),
(6, 'Sumit', 'sumit007@gmail.com'),
(4, 'Robin', 'robin@gmail.com'),
(5, 'Robin', 'robin@gmail.com');

-- Get duplicate users from the table

-- solution 1
select * from users
group by user_name
having count(user_name) > 1
order by user_id;

    
-- solution 2

select user_id, user_name, email from (
select *,
row_number() over (partition by user_name) as rn
from users
order by user_id
) x
where x.rn <> 1
order by user_id;

tion by user_name) as rn
from users
order by user_id
) x
where x.rn <> 1
order by user_id;

