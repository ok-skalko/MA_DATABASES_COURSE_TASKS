select title,rating,description from sakila.film
where description like '%database%'

select distinct first_name,description from sakila.actor as a
join sakila.film_actor as f on a.actor_id=f.actor_id
join sakila.film as fi on f.film_id=fi.film_id
where fi.rating = "G" and fi.description like '%cat%'
order by first_name

select 
count(film_id) as count_of_items,
min(rental_rate) as min_rate,
round(avg(rental_rate),2) as average_rental_rate,
max(rental_rate) as max_rental_rate,
round(avg(replacement_cost),2)  as average_replacement,
min(length) as min_length,
round(avg(length),2) as average_length,
max(length) as max_length
from sakila.film

select count(country) as count_cities,country  from sakila.country as c
join sakila.city as city on c.country_id=city.country_id
group by country

select count(*) as count,name as name_category from sakila.film as f
join sakila.film_category as c on f.film_id=c.film_id
join sakila.category as cat on c.category_id=cat.category_id
group by cat.name

select count(*) as "Films",first_name as "First name",last_name as "Last name" from sakila.film as f
join sakila.film_actor as fa on f.film_id=fa.film_id
join sakila.actor as a on fa.actor_id=a.actor_id
group by a.first_name,a.last_name
order by first_name

select count(*) as "Count actors",name as "Category name" from sakila.actor as a
join sakila.film_actor as fa on a.actor_id=fa.actor_id
join sakila.film_category as cat on fa.film_id=cat.film_id
join sakila.category as c on cat.category_id=c.category_id
group by name
order by name

select count(*) as count_address,district as district_name from sakila.address
where district like "Central%"
group by district
order by district

select count(*) as count,store_id as Store,active as Active from sakila.customer 
group by store_id,active
order by store_id

select first_name as customer, min(payment_date)as first_pay_date,max(payment_date)as last_pay_date,sum(amount) from sakila.payment as p
join sakila.customer as c on p.customer_id=c.customer_id
group by first_name
order by first_name

select title as Title,sum(amount)as Amount from sakila.film as f
join sakila.inventory as i on f.film_id=i.film_id
join sakila.rental as r on i.inventory_id=r.inventory_id
join sakila.payment as p on r.rental_id=p.rental_id
group by f.title

select* from sakila.film 
where length = (select max(length) from sakila.film)
order by title



