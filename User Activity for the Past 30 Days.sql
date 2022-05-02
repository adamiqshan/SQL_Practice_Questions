-- User Activity for the Past 30 Days I 
-- https://leetcode.com/problems/user-activity-for-the-past-30-days-i/ 

-- Write an SQL query to find the daily active user count for a period of 30 days      ending 2019-07-27 inclusively. A user was active on someday if they made at         least one activity on that day.
    
create table activity(
    user_id int,
    session_id int,
    activity_date date,
    activity_type enum
);

insert into activity values
(1, 1, '2019-07-20', 'open_session'),
(1, 1, '2019-07-20', 'scroll_down '),
(1, 1, '2019-07-20', 'end_session '),
(2, 4, '2019-07-20', 'open_session'),
(2, 4, '2019-07-21', 'send_message'),
(2, 4, '2019-07-21', 'end_session '),
(3, 2, '2019-07-21', 'open_session'),
(3, 2, '2019-07-21', 'send_message'),
(3, 2, '2019-07-21', 'end_session '),
(4, 3, '2019-06-25', 'open_session'),
(4, 3, '2019-06-25', 'end_session '),
(4, 3, '2019-06-28', 'end_session ');

select activity_date as day, count(distinct user_id)  as active_users from activity
group by activity_date
having activity_date > date('2019-07-27', '-30 day')