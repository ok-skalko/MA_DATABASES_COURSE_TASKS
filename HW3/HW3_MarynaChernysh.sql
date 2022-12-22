"#1"
select title, rating
from sakila.film
where description like "%database%";

"#2"
select first_name, last_name from sakila.actor
where actor_id IN (
   select actor_id from sakila.film_actor 
   where film_id IN (
      select film_id from sakila.film
      where rating like "G" and description like "%cat%")
      )
order by last_name, first_name;

"#3"
select   count(title) as number_film, round(avg(replacement_cost), 2) as av_rep_cost,
 round(avg(rental_rate),2), max(rental_rate), min(rental_rate), max(length), min(length), avg(length)
from sakila.film
;

"#4"
select country, count(city) from sakila.city
join sakila.country using (country_id)
group by country;

"#5"
Select  name, count(title) from sakila.film
join sakila.film_category using (film_id)
join sakila.category using (category_id)
group by name;

"#6"
select title, count(first_name) from sakila.actor
join sakila.film_actor using (actor_id)
join sakila.film using (film_id)
group by title

"#7"
select name, count(first_name) from sakila.actor
join sakila.film_actor using (actor_id)
join sakila.film_category  using (film_id)
join sakila.category using(category_id)
group by name;

"#8"

select district, count(address) from sakila.address
where district like "Central%"
group by district
order by district

"#9"

select store_id as number_store, active as active_cust, count(customer_id) as numb_customers from sakila.customer
join sakila.store using (store_id)
group by store_id, active;


"#10"
select first_name, last_name, min(payment_date), max(payment_date), sum(amount) from sakila.customer
join sakila.payment using (customer_id)
group by customer_id
order by sum(amount) desc;

"#11"


select distinct title, sum(amount) as income_sum  from sakila.film
join sakila.inventory using (film_id)
join sakila.rental using (inventory_id)
join sakila.payment using (rental_id)
group by title
order by income_sum desc

"#12"

select * from sakila.film
where length = 
  ( select  max(length) from sakila.film   );
