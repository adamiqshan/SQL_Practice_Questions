-- Find Median Given Frequency of Numbers

create table numbers (
    number int,
    frequency int
);

insert into numbers values
    (0, 1),
    (1, 1),
    (2, 3),
    (3, 1);


-- from stackoverflow
select avg(number)
from(
    select *,
        sum(frequency) over (order by number asc) as sum_freq,
        sum(frequency) over () as cnt
from numbers
) t
where cnt <= 2 * sum_freq and
      cnt >= 2 * (sum_freq - frequency);


-- from codecircle
select round(sum(Number) / count(Number), 2) as median
from (select Number, Frequency,
      sum(Frequency) over (order by Number) as cumulative_num,
      sum(Frequency) over () as total_num
      from Numbers) sub
where total_num / 2.0 between cumulative_num - Frequency and cumulative_num;