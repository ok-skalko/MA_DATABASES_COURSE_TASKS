-- Task 1;
select count(*) from sakila.customer;
select * from sakila.customer
limit 100;

-- Task 2;
select  first_name as "First Name", 
		last_name as "Last Name",
		email as "Email" 
from sakila.customer
limit 100;

-- Task 3;
select   address as "Address", 
		district as "District",
        postal_code as "Postal Code"
from sakila.address
order by district asc, address desc
limit 100;

-- Task 4;
select title, rental_rate
from sakila.film
where rental_rate > 3;

-- Task 5;
select title, description,rating
from sakila.film
where rating in ("G","PG","R");

-- Task 6;
select *
from sakila.film
where rental_duration = 3 and  replacement_cost < 12;

-- Task 7;
select *
from sakila.film
where rating = "G" and replacement_cost > 15;

-- Task 8;
select *
from sakila.film
where length between 60 and 90
order by length;
