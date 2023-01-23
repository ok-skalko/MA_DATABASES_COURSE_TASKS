-- Task 1

select * from sakila.film as sf
where sf.description like '%Database%';

-- Task 2

select first_name, last_name from sakila.film as sf
join sakila.film_actor as sfa on sf.film_id = sfa.film_id
join sakila.actor as sa on sfa.actor_id=sa.actor_id
where rating = 'g' and sf.description like '%cat%';

-- Task 3

select
count(film_id) as 'Films amount',
min(rental_rate) as 'Min Rental Rate',
max(rental_rate) as 'Max Rental Rate',
avg(rental_rate) as 'Average Rental Rate',
avg(replacement_cost) as 'Average Replacement Cost',
min(length) as 'Min Film Duration',
max(length) as 'Min Film Duration',
avg(length) as 'Average Film Duration'
from sakila.film as sf;

-- Task 4

select sci.country_id, country, count(city) from sakila.city as sci
join sakila.country as sco on sci.country_id = sco.country_id
group by country_id;

-- Task 5

select category_id, count(film_id) from sakila.film_category
group by category_id;

-- Task 6

select film_id, count(actor_id) as 'actors' from sakila.film_actor
group by film_id;

-- Task 7

select category_id, count(actor_id) as 'Actors amount' from (
select actor_id, sfa.film_id, category_id from sakila.film_actor as sfa
join sakila.film_category as sfc on sfa.film_id=sfc.film_id) as actcat
group by category_id;

-- Task 8

select district, count(address) as 'Amount of addresses' from sakila.address
where district like '%Central%'
group by district;

-- Task 9

select store_id,

(select count(customer_id)
 from sakila.customer as cs2
where cs2.active = 1 and cs1.store_id = cs2.store_id) as 'active customers',

(select count(customer_id)
 from sakila.customer as cs2
where cs2.active = 0 and cs1.store_id = cs2.store_id) as 'non-active customers'

 from sakila.customer as cs1
group by store_id;

-- Task 10


select sc.customer_id, first_name, last_name, sum(amount) as 'total sum', min(payment_date) as 'first payment', max(payment_date) as 'last payment' from sakila.customer as sc
join sakila.payment as sp on sc.customer_id = sp.customer_id
group by sc.customer_id;

-- Task 11

select title,sum(amount)as summary_amount from sakila.film as sf
join sakila.inventory as si on sf.film_id=si.film_id
join sakila.rental as sr on si.inventory_id=sr.inventory_id
join sakila.payment as sp on sr.rental_id=sp.rental_id
group by sf.title

  -- Task 12

select title, length from sakila.film
where length = (select max(length) from sakila.film)
order by title



