-- Task 1
select title, rating
from sakila.film
where description like '%database%';

-- Task 2
select a.first_name, a.last_name
from sakila.actor as a
join sakila.film_actor as fa on a.actor_id = fa.actor_id
join sakila.film as f on fa.film_id = f.film_id
where f.description like '%cat%' and f.rating = 'G';

-- Task 3
select
    count(*) as 'amount of films',
    max(rental_rate) as 'max rental rate',
    min(rental_rate) as 'min rental rate',
    avg(rental_rate) as 'average rental rate',
    avg(replacement_cost) as 'average replacement_cost',
    max(length) as 'max length',
    min(length) as 'min length',
    avg(length) as 'average length'
from sakila.film;

-- Task 4
select
    country.country,
    count(city.city_id) as 'amount of cities'
FROM sakila.city as city
join sakila.country as country on city.country_id = country.country_id
group by city.country_id;

-- Task 5
select
    c.name as 'category name',
    count(fc.film_id) as 'amount of films'
FROM sakila.film_category as fc
join sakila.category as c on fc.category_id = c.category_id
group by fc.category_id;

-- Task 6
select
    f.title as 'film name',
    count(fa.actor_id) as 'amount of actors'
FROM sakila.film_actor as fa
join sakila.film as f on fa.film_id = f.film_id
group by fa.film_id;

-- Task 7
select
    c.name as 'category name',
    count(fa.actor_id) as 'amount of actors'
FROM sakila.film_actor as fa
join sakila.film_category as fc on fa.film_id = fc.film_id
join sakila.category as c on fc.category_id = c.category_id
group by fc.category_id;

-- Task 8
select
    district,
    count(address) as 'count of addresses'
from sakila.address
where district like 'Central%'
group by district;

-- Task 9
select
    store_id,
    active,
    count(customer_id) as 'count of customers'
from sakila.customer
join sakila.store using(store_id)
group by store_id, active;

-- Task 10
select
    c.first_name as 'First name',
    c.last_name as 'Last name',
    min(p.payment_date) as 'First payment date',
    max(p.payment_date) as 'Last payment date',
    sum(p.amount) as 'Total amount'
from sakila.customer as c
join sakila.payment as p on c.customer_id = p.customer_id
group by c.first_name, c.last_name;

-- Task 11
select
    f.title as 'Film name',
    sum(p.amount) as 'Total amount'
from sakila.film as f
join sakila.inventory as i on f.film_id = i.film_id
join sakila.rental as r on r.inventory_id = i.inventory_id
join sakila.payment as p on r.rental_id = p.rental_id
group by f.title;

-- Task 12
select * from sakila.film
where length = (
    select max(length)
    from sakila.film
);
