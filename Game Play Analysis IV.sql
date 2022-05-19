-- Game Play Analysis IV

/*

Write an SQL query that reports the fraction of players that logged in again on the
day after the day they first logged in, rounded to 2 decimal places. In other words,
you need to count the number of players that logged in for at least two consecutive
days starting from their first login date, then divide that number by the total number
of players.
*/

create table activity
(   
    player_id    int,
    device_id    int,
    event_date   date,
    games_played int
);


insert into activity values
    (1, 2, '2016-03-01', 5),
    (1, 3, '2016-03-02', 5),
    (1, 2, '2016-05-02', 6),
    (2, 3, '2017-06-25', 1),
    (3, 1, '2016-03-02', 0),
    (3, 4, '2018-07-03', 5),
    (3, 4, '2018-07-04', 5),
    (4, 2, '2018-07-04', 5);


--solution 1
with logins_total as (
select count(distinct a.player_id) as players
from activity a
join activity b
on a.player_id = b.player_id
where julianday(b.event_date) - julianday(a.event_date) = 1 
),
total_users as (
    select count(distinct player_id) as total_players
    from activity
)

select round((players+0.0)/total_players,2) as fraction 
from total_users, logins_total
