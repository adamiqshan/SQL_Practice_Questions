-- Human Traffic of Stadium

-- Write an SQL query to display the records with three or more rows with consecutive id ’s, and the number of people is greater than or equal to 100 for each

create table stadium (
    id int, 
    date DATE NULL, 
    people int
);

insert into stadium (id, date, people) values ('1', '2017-01-01', '100');
insert into stadium (id, date, people) values ('2', '2017-01-02', '109');
insert into stadium (id, date, people) values ('3', '2017-01-03', '150');
insert into stadium (id, date, people) values ('4', '2017-01-04', '101');
insert into stadium (id, date, people) values ('5', '2017-01-05', '145');
insert into stadium (id, date, people) values ('6', '2017-01-06', '14');
insert into stadium (id, date, people) values ('7', '2017-01-07', '199');
insert into stadium (id, date, people) values ('8', '2017-01-08', '188');

with consecutive as (
    select s.id, s.date, s.people, rnum.num from stadium s
    join (select id,row_number() over(order by date) as num from stadium
    where people>=100) rnum
    on rnum.id = s.id
),
diff as (
    select id-num as grp, id, date, people from consecutive
)

select id, date as visit_date, people from diff
where grp in 
    (select grp from diff
    group by grp
    having count(1)>2)

