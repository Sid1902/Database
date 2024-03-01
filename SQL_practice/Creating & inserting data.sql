create database iNeuron; 
use iNeuron;
create table Courses(course_id  char(5),course_name varchar(25), duration int,faculty varchar(30));
describe courses;
select * from courses;
insert into courses values(1257,"Data Analyitcs",9,"Vikrant");
insert into courses values(1258,"Data Science ",11,"Saurabh");
insert into courses values(1259,"Machine_Learning ",12,"Saurabh");
insert into courses (course_id,course_name,faculty) values(1260,"Artificial_intelligence","Saurabh");

alter table courses 
add column Experience int;

alter table courses 
drop column Experience;


#how to create database a/ add data to table / export data 



