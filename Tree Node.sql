-- Tree Node
-- https://leetcode.com/problems/tree-node/

-- Write an SQL query to report the type of each node in the tree.

create table tree 
(
    id int, 
    p_id int
);

insert into tree VALUES
    (1, null),
    (2, 1),
    (3, 1),
    (4,2),
    (5,2),
    (6,3);

select id, case
                when p_id is null then 'Root'
                when id in (select distinct p_id from tree where p_id is not null)
                    then 'Inner'
                else 'Leaf'
                end as Type
from tree

-- ** do not use NOT IN when the comparison set has NULL value
-- Comparison of a value to a NULL is unknown and if any one of those NOT IN comparisons is unknown     then the result is also deemed to be unknown.