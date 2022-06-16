-- Remove Duplicate Number Value Pairs

create table number_pairs(
    A int,
    B int
);

insert into number_pairs values
    (1,2),
    (3,2),
    (2,4),
    (2,1),
    (5,6),
    (4,2);

select t1.A, t1.B
from number_pairs t1
left join number_pairs t2
on t1.B = t2.A and t1.A = t2.B
where t2.A is null or t1.A < t2.A

