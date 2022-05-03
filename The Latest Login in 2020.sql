-- The Latest Login in 2020
-- https://leetcode.com/problems/the-latest-login-in-2020/

-- Write an SQL query to report the latest login for all users in the year 2020. Do     not include the users who did not login in 2020.

create table logins
(
    user_id int,
    time_stamp datetime
);

insert into logins values
    (6, '2020-06-30 15:06:07'),
    (6, '2021-04-21 14:06:06'),
    (6, '2019-03-07 00:18:15'),
    (8, '2020-02-01 05:10:53'),
    (8, '2020-12-30 00:46:50'),
    (2, '2020-01-16 02:49:50'),
    (2, '2019-08-25 07:59:08'),
    (14, '2019-07-14 09:00:00'),
    (14, '2021-01-06 11:59:59');


select user_id, max(time_stamp) last_stamp
from logins
where strftime('%Y', time_stamp) = '2020'
group by user_id

/* MYSQL Soln.

select user_id, max(time_stamp) last_stamp
from logins
where strftime('%Y', time_stamp) = '2020'
group by user_id

*/