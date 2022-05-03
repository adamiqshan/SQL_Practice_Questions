-- Game Play Analysis I
-- https://leetcode.com/problems/game-play-analysis-i/

-- Write an SQL query to report the first login date for each player.

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


select player_id, min(event_date) as first_login
from activity
group by player_id;


-- using row_number() is faster than the above soln.

select x.player_id, x.event_date as first_login
from (
    select player_id, event_date,
            row_number() over(partition by player_id order by event_date) as                     first_date
    from activity
) x
where x.first_date = 1;