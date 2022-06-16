create table weather
(
id int,
city varchar(50),
temperature int,
day date
);

insert into weather values
(1, 'London', -1, ('2021-01-01')),
(2, 'London', -2, ('2021-01-02')),
(3, 'London', 4, ('2021-01-03')),
(4, 'London', 1, ('2021-01-04')),
(5, 'London', -2, ('2021-01-05')),
(6, 'London', -5, ('2021-01-06')),
(7, 'London', -7, ('2021-01-07')),
(8, 'London', 5, ('2021-01-08'));

select * from 
    (select *, case 
        when temperature < 0 and 
        lead(temperature) over (order by id) < 0 and
        lead(temperature, 2) over (order by id) < 0    
        then 'extreme'

        when temperature < 0 and 
        lag(temperature) over (order by id) < 0 and
        lead(temperature) over (order by id) < 0    
        then 'extreme'

        when temperature < 0 and 
        lag(temperature) over (order by id) < 0 and
        lag(temperature,2) over (order by id) < 0    
        then 'extreme'
    
        end as ext_days
from weather) x
    where x.ext_days is not null


