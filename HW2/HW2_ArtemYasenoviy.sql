-- 1
select
	address, (
		select city
		from sakila.city
		where sakila.city.city_id
        = sakila.address.city_id) 
        as "City"
from sakila.address
where sakila.address.phone = ''
or sakila.address.postal_code = '';

-- 1-joins

select address, city
from sakila.address as address
join sakila.city as city 
	on city.city_id = address.city_id	
where 
	sakila.address.phone = '' or
    sakila.address.postal_code = '';
    
-- 2

select city, country
from sakila.city as city
join sakila.country as country 
	on sakila.country.country_id = sakila.city.country_id
where 
	sakila.country.country in ('Argentina', 'Austria')
order by city;

-- 3

select first_name, last_name
from sakila.actor as actor
join sakila.film_actor as film_actor 
    on actor.actor_id = film_actor.actor_id
join sakila.film_category as film_category 
    on film_actor.film_id = film_category.film_id
join sakila.category as category 
    on category.category_id = film_category.category_id
where 
	category.name in ('Sports', 'Music');

-- 4

select distinct
	first_name, last_name from sakila.customer as customer
join sakila.rental as rental
    on customer.customer_id = rental.customer_id
where 
	rental.return_date is null;
    
-- 5

select title
from sakila.film as film
join sakila.inventory as inventory 
	on inventory.film_id = film.film_id
join sakila.rental as rental
    on rental.inventory_id = inventory.inventory_id
join sakila.staff as staff
    on staff.staff_id = rental.staff_id
where
	staff.first_name = 'Mike' and 
    staff.last_name = 'Hillyer';
    
-- 6    

select first_name, last_name 
from sakila.customer as customer
join sakila.rental as rental 
	on rental.customer_id = customer.customer_id
join sakila.inventory as inventory 
    on inventory.inventory_id = rental.inventory_id
join sakila.film as film 
    on film.film_id = inventory.film_id
where film.title in 
	('SWEETHEARTS SUSPECTS', 'TEEN APOLLO', 'TIMBERLAND SKY', 'TORQUE BOUND');
        
-- 7

select title from sakila.film
where film_id in (
  select film_id 
  from sakila.inventory
  where inventory_id in (
    select inventory_id 
    from sakila.rental
    where return_date is null)
) and replacement_cost > 10;
    
-- 8

select
  (select customer.first_name 
  from sakila.customer 
  where customer.customer_id = payment.customer_id) 
  as "First name",
  (select customer.last_name 
  from sakila.customer
  where customer.customer_id = payment.customer_id ) 
  as "Last name",
  payment.payment_date,
  payment.amount
from sakila.payment
where payment.amount > 10
order by payment.payment_date;  

-- 8 -join
select distinct
	customer.first_name,
    customer.last_name,
    payment.payment_date,
    payment.amount
from sakila.customer
join sakila.payment 
on payment.customer_id = customer.customer_id
where payment.amount > 10
order by payment_date;