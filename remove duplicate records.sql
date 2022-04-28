create table users
(
id int primary key,
email varchar(50));

insert into users values
(1, 'sumit@gmail.com'),
(7, 'sumit@gmail.com'),
(2,'reshma@gmail.com'),
(3, 'farhana@gmail.com'),
(8, 'farhana@gmail.com');


select * from users
    where id not in (select u2.id from users u1, users u2
where u1.email = u2.email and u1.id<u2.id)
