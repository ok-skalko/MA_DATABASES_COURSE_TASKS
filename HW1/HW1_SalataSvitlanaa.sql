/*select*
from sakila.customer */

select first_name as 'First name' , last_name as 'Last name', email as 'Email'
from sakila.customer 

select address as 'Address', district as 'District', postal_code as 'Postal Code'
from sakila.address
order by district , address desc 

select title, rental_rate
from sakila.film
where rental_rate >3 

select title, description, rating
from sakila.film
where rating in ('G' , 'PG', 'R') 

select *
from sakila.film
where replacement_cost <12 and rental_duration = 3

select *
from sakila.film
where replacement_cost > 15 and  rating= 'G'

select *
from sakila.film
where length between 60 and 90