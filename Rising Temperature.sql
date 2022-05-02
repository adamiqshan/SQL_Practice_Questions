-- Rising Temperature
-- https://leetcode.com/problems/rising-temperature/

-- Write an SQL query to find all dates' Id with higher temperatures compared to       its previous dates (yesterday).


create table weather(
    id int,
    recordDate date,
    temperature int
);

insert into weather values
    (1, '2015-01-01', 10),
    (2, '2015-01-02', 25),
    (3, '2015-01-03', 20),
    (4, '2015-01-04', 30);

/*

-- SQLite solution 1

select w2.id
from weather w1
join weather w2 on w2.temperature > w1.temperature
where julianday(w2.recordDate)-julianday(w1.recordDate) = 1

*/

-- SQLite solution 2

select id
from
    (select *, lag(temperature) over(order by recordDate) as prevTemp,
                lag(recordDate) over(order by recordDate) as prevDay
    from weather) x
where temperature > prevTemp and julianday(recordDate) - julianday(prevDay) = 1

-- replace julianday with datediff(date1, date2) or date_add(date, interval x day)     for mysql or postgresa