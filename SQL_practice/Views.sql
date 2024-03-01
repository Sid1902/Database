use ineuron;
create table customer_info (
customer_id int primary key,
first_name text,
last_nme text);


create table orders (
order_id int primary key,
customer_id int,
order_date date,
item text,
quantity int,
price float
);

insert into customer_info values(101,'john','Doe');

insert into orders values (1,101,'2022-01-01','Shoes',2,50);

-- View Statement
create view customer_order_view as 
select customer_info.customer_id , first_name , last_nme ,order_date,item , price , quantity from customer_info 
join orders on customer_info.customer_id = orders.customer_id;

select * from customer_order_view;

insert into customer_info values(102,'john','Doe');
insert into orders values (2,102,'2022-01-01','Shoes',2,50);
