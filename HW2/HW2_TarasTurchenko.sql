-- Task 1
-- Вивести адресу і місто до якого відноситься ця адреса,
-- у яких незаповнені phone або postal_code. (таблиці address, city).

-- JOIN
select
    a.address_id as 'ID',
    a.address as 'Address',
    c.city as 'City'
from address a
join city c on c.city_id = a.city_id
where a.phone = '' or a.postal_code = ''
order by a.address_id;

-- SUB-QUERY
select
    a.address_id as 'ID',
    a.address as 'Address',
    (select c.city from city c where c.city_id = a.city_id) as 'City'
from address a
where a.phone = '' or a.postal_code = '';



-- Task 2
-- Вивести список міст Аргентини і Австрії (таблиці city, country).
-- Відсортувати за алфавітом.

-- JOIN
select c.city_id as 'ID', c.city as 'City' from city c
join country c2 on c2.country_id = c.country_id
where c2.country in ('Argentina', 'Austria')
order by c.city;

-- SUB-QUERY
select c.city_id as 'ID', c.city as 'City' from city c
where c.country_id in (
    select c2.country_id from country c2
    where c2.country in ('Argentina', 'Austria')
)
order by c.city;



-- Task 3
-- Вивести список акторів, що знімалися в фільмах категорій Music, Sports.
-- (використати таблиці actor, film_actor, film_category, category).

-- JOIN
select distinct
    a.actor_id   as 'ID',
    a.first_name as 'First Name',
    a.last_name  as 'Last Name'
from film_actor fa
left join actor a on fa.actor_id = a.actor_id
left join film_category fc on fa.film_id = fc.film_id
left join category c on fc.category_id = c.category_id
where c.name in ('Music', 'Sports')
order by a.actor_id;

-- SUB-QUERY
select
    a.actor_id   as 'ID',
    a.first_name as 'First Name',
    a.last_name  as 'Last Name'
from actor a
where a.actor_id in (
    select fa.actor_id from film_actor as fa
    where fa.film_id in (
        select fc.film_id from film_category as fc
        where fc.category_id in (
            select c.category_id from category as c
            where c.name in ('Music', 'Sports')
        )
    )
);
