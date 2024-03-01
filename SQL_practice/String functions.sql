use sakila;

select * from customer;

# String Fucntions : 
# 1. Concat

select customer_id , first_name , last_name , concat(first_name ," " , last_name) as full_name from customer;

#2. Upper and Lower functions

select customer_id ,  first_name ,last_name , lower(first_name) ,lower(last_name) from customer;


#3. Length() function

select customer_id, first_name ,length(first_name) as FN from customer;

select * from city;
select * from country;

select CT.country_id,city,country
from city as CT
inner join country as CY
on CT.country_id = CY.country_id;

















