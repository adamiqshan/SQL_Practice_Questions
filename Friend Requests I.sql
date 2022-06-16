-- Friend Requests I: Overall Acceptance Rate

create table social (
    sent_id int,
    received_id int
);

insert into social values
    (0, 1),
    (1, 1),
    (1, 1),
    (2, 3),
    (3, 1);

with accepts as(
    select count(*) as acc
    from (
        select distinct  sent_id, received_id from social
    )
),
requests  as(
    select count(*) as req
    from (
        select  sent_id, received_id from social
    )
)


select acc/(req+0.0) from accepts, requests;