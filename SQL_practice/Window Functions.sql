use ineuron;
create table sales_p (date date , salesperson varchar(50), sales_amount int);

insert into sales_p values
('2022-01-01','Alice',1000),
('2022-01-01','Bob',1500),
('2022-01-02','Alice',2000),
('2022-01-02','Bob',2500),
('2022-01-03','Alice',3000),
('2022-01-03','Bob',3500),
('2022-01-04','Alice',4000),
('2022-01-04','Bob',4500),
('2022-01-05','Alice',5000),
('2022-01-05','Bob',5500);

select * from sales_p;

#here we have to calculate the running total of each day of each salesperson and not the final sales total
# i.e first day is 1000 then second day willl be 1000+2000 = 3000 and so on 
-- runnning total is 1000 + 2000 + 3000 of each person

select salesperson , sum(sales_amount) from sales_p group by salesperson;


select 
salesperson , 
sales_amount , 
sum(sales_amount) 
over(partition by salesperson order by date ) as running_total -- window function
from sales_p;



select 
salesperson , 
sales_amount , 
avg(sales_amount) 
over(partition by salesperson order by date ) as running_total -- window function
from sales_p;

drop table sales_data;
create table sales_data(
id serial primary key,
date date,
item text,
units_sold int,
price_per_unit float);

insert into sales_data (date,item,units_sold,price_per_unit)
values
('2021-01-01','Apple',10,1.50),
('2021-01-02','Banana',20,0.75),
('2021-01-03','Orange',15,1.00),
('2021-01-04','Apple',12,1.50),
('2021-01-05','Banana',18,0.75),
('2021-01-06','Orange',20,1.00),
('2021-01-07','Apple',8,1.50),
('2021-01-08','Banana',22,0.75),
('2021-01-09','Orange',10,1.00);


-- Anayltical Function() : Rank(),DenseRank(),Row_NUmber

-- RANK() function
select item,units_sold,price_per_unit, RANK() OVER(order by units_sold) as units_rank
from sales_data; 

-- DENSE_RANK()

select item,units_sold,price_per_unit ,
DENSE_RANK() OVER(order by units_sold) as units_dense_rank,
RANK() OVER(order by units_sold) as units_rank 
from sales_data;


-- ROW NUmber()

select item,units_sold,price_per_unit,
ROW_NUMBER() OVER(order by units_sold) as row_number_based_on_units
from sales_data;


-- Value Functions  : LAG() , LEAD()


select item,price_per_unit,units_sold,
lag(units_sold) over(order by units_sold) as previous_units 
from sales_data;

select item,price_per_unit,units_sold,
lead(units_sold) over(order by units_sold) as previous_units 
from sales_data;

select item,price_per_unit,units_sold,
lag(units_sold,2) over(order by units_sold) as previousd_units,
lead(units_sold,2) over(order by units_sold) as post_units
from sales_data;

select item,price_per_unit,units_sold,
lag(units_sold) over(order by units_sold) as previousd_units,
lead(units_sold) over(order by units_sold) as post_units
from sales_data;