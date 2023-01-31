/01
select * from sakila.customer;

/02
select 
  first_name, last_name, email 
from sakila.customer;

/03
select 
  address as "Address", 
  district as "District", 
  postal_code as "Postal Code" 
from sakila.address
order by 
  district asc,
  address desc;

/04
select 
  title, rental_rate
from sakila.film
  where rental_rate > 3;

/05
select 
  title, description, rating
from sakila.film
  where rating in ('G', 'PG', 'R');

/06
select * from sakila.film
  where rental_duration = 3 and
  replacement_cost < 12

/07
select * from sakila.film
  where rating = 'G' and
  replacement_cost > 15

/08
select * from sakila.film
  where length >= 60 
  and length <= 90 

