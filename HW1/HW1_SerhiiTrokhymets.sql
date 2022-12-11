-- Ex 1
select * from sakila.customer;

-- Ex 2
select 
  first_name as "First Name", 
  last_name as "Last Name", 
  email as "Email" 
from sakila.customer;

-- Ex 3 desc
select
  address as "Addres",
  district as "District",
  postal_code as "Postal Code"
from sakila.address
order by district, address desc;

-- Ex 4
select * from sakila.film
  where rental_rate > 3;
  
--   Ex 5
select 
  title as "Title",
  description as "Description",
  rating as "Rating"
from sakila.film
  where rating in ("G", "PG", "R"); 
  
--   Ex 6
select * from sakila.film
  where rental_duration = 3 and replacement_cost < 12;
  
--   Ex 7
select * from sakila.film
  where rating = "G" and replacement_cost > 15;
  
--   Ex 8
select * from sakila.film
where length between 60 and 90;
