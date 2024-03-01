use world;
describe country;

select * from country;

select distinct Continent from country;

select Name,concat(Continent, ', '  ,Region,  ', '  ,Capital) as Address from country;

select * from country order by Continent;

select Region, count(name) as Total_countries, sum(SurfaceArea) as 'Total Surface Area' ,sum(Population) as 'Total Population'  , 
avg(LifeExpectancy) as 'Total Life Expectancy'  from country group by Region ;

select Name , sum(SurfaceArea) as 'Total Surface Area' ,sum(Population) as 'Total Population'  , 
avg(LifeExpectancy) as 'Total Life Expectancy'  from country group by Name ;

select continent , region from country where region = 'Australia and New Zealand';

alter table country
rename column Name to Country;

select * from country;

select Continent , count(country) as no_of_countries from country group by  
continent ;

select * from country;

# Categorixe countries as under-deveoped , developing and developed using Gnp

select min(GNP) , max(GNP) from country;

select country , continent, 
case
when GNP < 1000000 then  "Under-Developed"
when GNp > 1000000 and GNP <=4500000 then "Developing"
else "Developed"
end as "Country Category"
from country
where case
when GNP < 1000000 then  "Under-Developed"
when GNp > 1000000 and GNP <=4500000 then "Developing"
else "Developed"
end = "Developing";

select country , continent, 
case
when GNP < 1000000 then  "Under-Developed"
when GNp > 1000000 and GNP <=4500000 then "Developing"
else "Developed"
end as "Country Category"
from country
where case
when GNP < 1000000 then  "Under-Developed"
when GNp > 1000000 and GNP <=4500000 then "Developing"
else "Developed"
end = "Under-Developed";

select 
case
when GNP < 1000000 then  "Under-Developed"
when GNp > 1000000 and GNP <=4500000 then "Developing"
else "Developed"
end as "Country Category" ,count(country)
from country
group by case
when GNP < 1000000 then  "Under-Developed"
when GNp > 1000000 and GNP <=4500000 then "Developing"
else "Developed"
end ;


#categotrize the countries as per the population density as LPD ,MPD ,HP
 
# population density = population / surface area 

select min(Population/SurfaceArea), max(Population/SurfaceArea) from country where SurfaceArea is not null ;

#lpd <=2000
#mpd 2000<mpd<15000
#hpd >15000

select country , Population/SurfaceArea as Population_Density , 
case 
when Population/SurfaceArea <= 2000 then 'LPD'
when Population/SurfaceArea > 2000 and Population/SurfaceArea <=15000 then 'MPD'
else 'HPD'
end as Categgory_Population_Density
from country;

select 
case
when Population/SurfaceArea <= 2000 then 'LPD'
when Population/SurfaceArea > 2000 and Population/SurfaceArea <=15000 then 'MPD'
else 'HPD'
end as Categgory_Population_Density ,
avg( Population/SurfaceArea) as Avg_population_Density,
count(country)
 
from country
group by 
(case 
when Population/SurfaceArea <= 2000 then 'LPD'
when Population/SurfaceArea > 2000 and Population/SurfaceArea <=15000 then 'MPD'
else 'HPD'
end);

select country ,Continent ,  Population/SurfaceArea as Population_Density , 
case 
when Population/SurfaceArea <= 2000 then 'LPD'
when Population/SurfaceArea > 2000 and Population/SurfaceArea <=15000 then 'MPD'
else 'HPD'
end as Categgory_Population_Density
from country
where
case 
when Population/SurfaceArea <= 2000 then 'LPD'
when Population/SurfaceArea > 2000 and Population/SurfaceArea <=15000 then 'MPD'
else 'HPD'
end = 'HPD' ;

