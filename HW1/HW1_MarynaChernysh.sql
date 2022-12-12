
Task1:
select *
from sakila.customer;

Task2:
select first_name as "First Name", last_name as "Last Name", email as "Email"
from sakila.customer;


Task3:
select address as "Address", district as "District", postal_code as "Postal Code" from sakila.address
order by district asc, address desc;

Task4:
select  title, rental_rate, replacement_cost from sakila.film
where rental_rate > 3;


Task:5
select title, description, rating from sakila.film
where rating like '%G' or rating like 'R';

Task 6:
select *  from sakila.film
where rental_duration=3 and replacement_cost<12;


Task7:
select title, description, rating from sakila.film
where rating like 'G' and replacement_cost>15;

Task8:
select * from sakila.film 
where length IN (60,90);

