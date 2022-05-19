-- Game Play Analysis III

-- Write an SQL query that reports for each player and date, how many games played so far by the player.

create table activity
(   
    player_id    int,
    device_id    int,
    event_date   date,
    games_played int
);


insert into activity values
    (1, 2, '2016-03-01', 5),
    (1, 2, '2016-05-02', 6),
    (2, 3, '2017-06-25', 1),
    (3, 1, '2016-03-02', 0),
    (3, 4, '2018-07-03', 5);


--solution 1
select player_id, 
        event_date, 
        sum(games_played) over(partition by player_id order by event_date) as games_played_so_far
from activity;


-- solution 2
select t1.player_id, 
        t1.event_date, 
        sum(t2.games_played) as games_played_so_far
from activity t1
join activity t2
on t1.player_id = t2.player_id
where t1.event_date >= t2.event_date
group by t1.player_id, t1.event_date;