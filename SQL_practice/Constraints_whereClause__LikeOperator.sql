use orders;
select * from online_customer;
select customer_id,customer_fname,customer_lname,customer_gender from online_customer as oc order by customer_gender;

use ineuron;
select * from courses;
alter table courses ;
alter table courses 
modify column course_id char(5) not null;	

insert into courses (course_name,faculty)
values("machine Engineer ","Vikas") ;# we declared course_id as not null hence wihtout thatb vslue query wont run

insert into courses (course_id , course_name,faculty)
values(	1261,"machine Engineer ","Vikas") ;

alter table courses 
modify column faculty varchar(30) not null;
insert into courses (course_id,course_name,faculty)
values(1262,"Big Data","Divya");

alter table courses 
modify column duration int default(12);

insert into courses (course_id,course_name,faculty)
values(1263,"Software_Developer","Saurabh");

alter table courses
modify column duration int check (duration>0);

# as we have put the constraint that check wheter duration >0 below query gives error as duration<0

#insert into courses (course_id,course_name,duration , faculty) 
#values(1263,"Software_Developer",-3,"Saurabh");


insert into courses (course_id,course_name,duration , faculty) 
values(1264,"Advanced_Soft_Developer",3,"Saurabh");

#this all constraints can also be applied while creating table only

drop table courses;

create table Courses(course_id  char(5) not null,course_name varchar(25) unique , duration int check(duration>0)  default(12),faculty varchar(30) );

select * from courses;

insert into courses 
values(1257,"Data Analyitcs",9,"Vikrant");
insert into courses
values(1258,"Data Science ",11,"Saurabh");
insert into courses 
values(1259,"Machine_Learning ",12,"Saurabh");
insert into courses (course_id,course_name,faculty)
values(1260,"Artificial_intelligence","Saurabh");
insert into courses (course_id , course_name,faculty)
values(	1261,"machine Engineer ","Vikas") ;
insert into courses (course_id,course_name,faculty)
values(1262,"Big Data","Divya");
insert into courses (course_id,course_name,faculty)
values(1263,"Software_Developer","Saurabh");

insert into courses (course_id,course_name,duration , faculty) 
values(1264,"Advanced_Soft_Developer",3,"Saurabh");


select * from courses;
use orders;
describe online_customer;

select * from online_customer;
y
#FILTERING DATA USING WHERE CLAUSE

select * from online_customer where customer_gender = "F";

select * from online_customer where customer_gender = "M";

select * from product;

#Fetch  the data of all products such that quantity >50 and len >200

select * from product where product_quantity_avail > 50 and len>200;

select product_desc,product_id as PID ,product_price as Price ,product_quantity_avail as Inventory  from product where product_quantity_avail > 50 and len>200;

select product_desc,product_id as PID ,product_price as Price ,product_quantity_avail as Inventory  from product where product_quantity_avail > 50 or len>200;

select * from product_class;

select * from product;

# FETCH THE DATA OF ALL PRODUCTS WHICH BELONG TO COMPANY 'SAMSUNG'
select * from product where product_desc like '%samsung%';

select * from product where product_desc like '%nokia%';

select * from product where product_desc like '%sony%';

select product_desc,product_id as PID ,product_price as Price ,product_quantity_avail as Inventory  from product where product_desc like "s%";

select product_desc,product_id as PID ,product_price as Price ,product_quantity_avail as Inventory  from product where product_desc like "%s";

select product_desc,product_id as PID ,product_price as Price ,product_quantity_avail as Inventory  from product where product_desc like "%s%";
