-- TASK1;

SELECT*FROM sakila.customer
LIMIT 10;

-- TASK2;

SELECT first_name AS "First Name", last_name AS "Last Name" FROM sakila.customer
limit 10;

-- TASK3;
select
address as "Address",
district as "District",
postal_code as "Postal Code"
from sakila.address
order by district
limit 10;

-- TASK3 FULL
select address as "Address",
district as "District",
postal_code as "Postal Code"
from sakila.address
order by address desc, district;


-- TASK3;

select
address as "Address",
district as "District",
postal_code as "Postal Code"
from sakila.address
order by address desc
limit 10;

-- TASK 4;
SELECT 
title AS "Name", rental_rate AS "Rental Cost" 
FROM sakila.film
WHERE rental_rate>3
LIMIT 10;

-- TASK 5;

SELECT 
title AS "Name", description AS "Description", rating AS "Rating"
FROM sakila.film
WHERE rating in ("G", "PG","R")
LIMIT 10;

-- TASK6;

SELECT
rental_duration AS "Rental Duration", replacement_cost AS "Replacement Cost"
FROM sakila.film
WHERE rental_duration=3 AND replacement_cost<12
LIMIT 10;

-- TASK7;
SELECT*FROM sakila.film
WHERE rating="G" AND replacement_cost>15
LIMIT 10;


-- TASK8;
SELECT*FROM sakila.film
WHERE length>=60 AND length<= 90
LIMIT 10;
