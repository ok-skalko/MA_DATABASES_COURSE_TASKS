-- 1
SELECT * FROM sakila.customer;

-- 2
SELECT
	first_name as "First Name",
	last_name as "Last Name"
from 
sakila.customer;

-- 3
SELECT
	address as "Address",
	district as "District",
	postal_code as "Postal Code"
from 
sakila.address
order by 
	district DESC, 
    address ASC; 

-- 4
SELECT
	title as "Film name",
	rental_rate "Rent price"
from 
	sakila.film
where 
	rental_rate > 3;

-- 5
SELECT
	title as "Film name",
	description as "Description",
	rating as "Rating"
from 
	sakila.film
where 
	rating = 'R' or 
	rating ='G' or 
	rating ='PG';

-- 6
select
	*
from
	sakila.film
where
	rental_duration = 3 
and 
	replacement_cost < 12;
    
-- 7
select
	*
from
	sakila.film
where
	rating = "G"
and 
	replacement_cost > 15;
    
-- 8
select 
	*
from
	sakila.film
where 
	length >= 60 and length <= 90;
