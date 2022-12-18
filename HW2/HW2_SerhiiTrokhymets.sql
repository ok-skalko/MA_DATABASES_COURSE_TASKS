-- Ex 1.1
select
  address,
  (select city from sakila.city where sakila.city.city_id = sakila.address.city_id)
from sakila.address
where sakila.address.phone = '' or sakila.address.postal_code = '';

-- Ex 1.2
select address, city from sakila.address as address
join sakila.city as city on city.city_id = address.city_id
where address.phone = '' or address.postal_code = '';

-- Ex 2.1
select city from sakila.city
where country_id in (
  select country_id from sakila.country
  where country = 'Argentina' or country = 'Austria'
);

-- Ex 2.2
select city from sakila.city
join sakila.country on sakila.country.country_id = sakila.city.country_id
where sakila.country.country in ('Argentina', 'Austria');


-- Ex 3.1
select first_name, last_name  from sakila.actor
where actor_id in (
  select actor_id from sakila.film_actor
    where film_id in (
    select film_id from sakila.film_category
      where category_id in (
      select category_id from sakila.category
      where name in ('Sports', 'Music')
    )
  )
);

-- Ex 3.2
select distinct first_name, last_name from sakila.actor as actor
join sakila.film_actor as film_actor on actor.actor_id = film_actor.actor_id
join sakila.film_category as film_category on film_actor.film_id = film_category.film_id
join sakila.category as category on category.category_id = film_category.category_id
where category.name in ('Sports', 'Music');

-- Ex 4.1
select
	first_name as 'Name',
	last_name as 'Surname'
from sakila.customer
where customer_id in (
	select customer_id from sakila.rental as rental
	where return_date is null
);

-- Ex 4.2
select distinct first_name, last_name from sakila.customer as customer
join sakila.rental as rental on customer.customer_id = rental.customer_id
where rental.return_date is null;

-- Ex 5.1
select
  title,
  film_id
from sakila.film
where film_id in (
  select distinct film_id from sakila.inventory
  where inventory_id in (
    select inventory_id from sakila.rental
    where staff_id = (
      select staff_id from sakila.staff
      where first_name = 'Mike' or last_name = 'Hillyer'
    )
  )
);

-- Ex 5.2
select distinct film.title, film.film_id from sakila.film as film
join sakila.inventory as inventory on inventory.film_id = film.film_id
join sakila.rental as rental on rental.inventory_id = inventory.inventory_id
join sakila.staff as staff on staff.staff_id = rental.staff_id
where staff.first_name = 'Mike' or staff.last_name = 'Hillyer';

-- Ex 6.1
select customer_id, first_name, last_name from customer
where customer_id in (
  select customer_id from rental
  where inventory_id in (
    select inventory_id from sakila.inventory
    where film_id in (
      select film_id from sakila.film
      where title in ('SWEETHEARTS SUSPECTS', 'TEEN APOLLO', 'TIMBERLAND SKY', 'TORQUE BOUND')
      )
    )
  );
  
--   Ex 6.2
select customer.customer_id, first_name, last_name from sakila.customer as customer
join sakila.rental as rental on rental.customer_id = customer.customer_id
join sakila.inventory as inventory on inventory.inventory_id = rental.inventory_id
join sakila.film as film on film.film_id = inventory.film_id
where film.title in ('SWEETHEARTS SUSPECTS', 'TEEN APOLLO', 'TIMBERLAND SKY', 'TORQUE BOUND');

-- Ex 7.1
select title from sakila.film
where film_id in (
  select film_id from sakila.inventory
  where inventory_id in (
    select inventory_id from sakila.rental
    where return_date is null
    )
) and replacement_cost > 10;

-- Ex 7.2
select title from sakila.film as film
join sakila.inventory as inventory on inventory.film_id = film.film_id
join sakila.rental as rental on rental.inventory_id = inventory.inventory_id
where rental.return_date is null and film.replacement_cost > 10;

-- Ex 8.1
select
  (select customer.first_name from customer as customer where customer.customer_id = payment.customer_id) as 'First name',
  (select customer.last_name from customer as customer where customer.customer_id = payment.customer_id ) as 'Last name',
  payment.payment_date,
  payment.amount
from sakila.payment as payment
where payment.amount > 10
order by payment.payment_date;  

select distinct 
  customer.first_name as 'First name',
  customer.last_name as 'Last name', 
  payment.payment_date,
  payment.amount
from sakila.customer as customer
join sakila.payment as payment on payment.customer_id = customer.customer_id
where payment.amount > 10
order by payment.payment_date;

