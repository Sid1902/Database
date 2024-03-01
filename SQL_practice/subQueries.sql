use orders;
select * from product;

select * from online_customer;

select * from order_header;

# numeric functions : abs() , round() , ceil() , floor()

select *,round(weight,2) as new_weight , abs(product_price) from product;

#Subquery

select * from online_customer;
select * from order_header;

select customer_id,customer_fname from online_customer
where customer_id in 
(
select customer_id from order_header where order_status='Cancelled'
);


#1. Display products where product_price is greater than avg product price

select product_id,product_desc,product_price  from product 
where product_price > 
(select avg(product_price) from product);

#2. select product greater than the averge price of their product_classs

select product_id,product_desc,product_price,product_class_code from product as p
where product_price >(select avg(product_price) from product where product_class_code = p.product_class_code);

#3. Retrieve customers whose orders contain a speciifc payment mode

select customer_id , customer_fname,customer_lname  from online_customer 
where customer_id in 
(select customer_id from order_header where payment_mode='Cash') limit 4; 


#4.Countries where life expectancy is greater than that of USA

use world;

select * from country ;

select country_name,LifeExpectancy from country where LifeExpectancy >  (select LifeExpectancy from country where Country_name='United States' );

select LifeExpectancy from country where Country='USA';

alter table country
rename column Country to country_name;

select * from country where country_name='United States';

use ineuron;
create table student(student_id varchar(10),name varchar(20));
insert into student values ('V001','Abe'),('V002','Abhay'),('V003','Acellin'),('V004','Adelphos');

create table marks(student_id varchar(10),marks int);
insert into marks values('V001',95),('V002',80),('V003',74),('V004',81);

##Now we want to write a query to identify all students who get better marks 
#than that of the student who's StudentID is 'V002',

select a.student_id , a.name as name,b.marks as total_marks  from student as a ,marks as b
where a.student_id =b.student_id and b.marks >
(select marks from marks where student_id='V002');

select a.student_id , a.name as name,b.marks as total_marks  from student as a ,marks as b
where b.student_id and b.marks > (select marks from marks where student_id='V002' );