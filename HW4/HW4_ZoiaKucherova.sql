-- Task 1

1. actor_info - ID, actor first and last names, his films by categories
2. customer_list - ID, customer first and lastname, his full postal address, activity status, shop ID
3. film_list - ID, films titles, describes ect added with actors play there
4. nicer_but_slower_film_list - the same, but actors are in low case style
5. sales_by_film_category - total sum sales by film category
6. sales_by_store - total sales by selected store
7. staff_list - full mail address of selected managers

-- Task 2

create view sakila.vw_film_actor as

select concat(first_name, ' ', last_name) as actor_full_name, title as film_name
from sakila.film_actor as sfa

join sakila.actor as sa on sfa.actor_id = sa.actor_id
join sakila.film as sf on sfa.film_id = sf.film_id;

-- task 3

create view sakila.vw_customer_info as

select concat(first_name, ' ',last_name) as customer_full_name,
 email as customer_email, address, district, city, country
from sakila.customer as sc
join sakila.address as sa on sc.address_id = sa.address_id
join sakila.city as sci on sa.city_id=sci.city_id
join sakila.country as sca on sci.country_id=sca.country_id

-- Task 4

create  view sakila.vw_film_category_stats as

select sc.name as category_name, count(film_id) as amount_of_films from sakila.film_category as sfc
join sakila.category as sc on sfc.category_id=sc.category_id
group by sc.name

-- Task 5

create  view sakila.vw_customer_top_payments as

select * from
(select concat(left(first_name, 1),'. ', last_name) as customer, sum(amount) as total_amount from sakila.payment as sp
join sakila.customer as sc on sp.customer_id=sc.customer_id

group by customer) as fcs
where fcs.total_amount > 190
