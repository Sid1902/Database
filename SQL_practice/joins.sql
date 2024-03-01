use ineuron;
create table employee(emp_id int , age int , gender char, salary varchar(20));
insert into employee values(201,32,"M","20K"),(202,33,"F","25K"),(203,22,"F","20K"),(204,23,"M","22K");

create table job(emp_id int,name varchar(20),job varchar(20),dept varchar(20));

insert into job values(202,'Shree','Mar','Ram'),(204,'Ram','Fin','Atul'),
(211,'Priya','HR','Raj'),
(212,'Ritu','Ops','Amar');

select * from employee;
select * from job;

select * from employee as E
right join job as J
on E.emp_id = J.emp_id
where E.emp_id is null;