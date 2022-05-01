-- Leetcode SQL problem 1795
-- https://leetcode.com/problems/rearrange-products-table/

-- Write an SQL query to rearrange the Products table so that each row has (product_id, store, price). If a product is not available in a store, do not include a row with that product_id and store combination in the result table.

-- Return the result table in any order.
    
create table products
(
    product_id int,
    store1 varchar,
    store2 varchar,
    store3 varchar
);

insert into products (product_id, store1, store2, store3) values (1, null, 89, 130);
insert into products (product_id, store1, store2, store3) values (2, 120, 129, 124);
insert into products (product_id, store1, store2, store3) values (3, 72, 121, 127);
insert into products (product_id, store1, store2, store3) values (4, 105, null, 127);
insert into products (product_id, store1, store2, store3) values (5, null, 102, 104);
insert into products (product_id, store1, store2, store3) values (6, 97, 106, 91);
insert into products (product_id, store1, store2, store3) values (7, null, 116, 99);
insert into products (product_id, store1, store2, store3) values (8, 97, 121, 86);
insert into products (product_id, store1, store2, store3) values (9, 107, null, 72);
insert into products (product_id, store1, store2, store3) values (10, 118, 86, 103);
insert into products (product_id, store1, store2, store3) values (11, 104, 78, 79);
insert into products (product_id, store1, store2, store3) values (12, 98, 78, 114);
insert into products (product_id, store1, store2, store3) values (13, 114, null, null);
insert into products (product_id, store1, store2, store3) values (14, 107, 114, 116);
insert into products (product_id, store1, store2, store3) values (15, null, 114, 77);
insert into products (product_id, store1, store2, store3) values (16, 75, 80, 123);
insert into products (product_id, store1, store2, store3) values (17, 129, null, 75);
insert into products (product_id, store1, store2, store3) values (18, 80, 87, 89);
insert into products (product_id, store1, store2, store3) values (19, 94, 71, 83);
insert into products (product_id, store1, store2, store3) values (20, null, 95, 81);


select product_id,'store1' as store, store1 as price
from products
where store1 is not null
union
select product_id, 'store2' as store, store2 as price
from products
where store2 is not null
union
select product_id, 'store3' as store, store3 as price
from products
where store3 is not null