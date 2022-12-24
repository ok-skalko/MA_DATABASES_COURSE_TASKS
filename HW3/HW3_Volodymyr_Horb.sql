-- TASK  1;
--Вивести назву і рейтинг фільмів в описі яких є слово “database”
SELECT title, rating
FROM sakila.film
where description like "%database%";

-- TASK  2;
--Вивести прізвище та ім’я акторів, які знімалися у фільмах з рейтингом “G” 
--і в описі яких є слово “cat”.
SELECT first_name ,last_name 
FROM sakila.actor as sa
join film_actor as fa  on fa.actor_id = sa.actor_id
where fa.film_id in (
SELECT film_id FROM sakila.film
where rating = "G" and description like "%cat%");

-- TASK  3;
/* За допомогою одного запиту вивести кількість фільмів в базі даних,
мінімальну, середню та максимальну вартість здачі в прокат (rental_rate),
середню replacement_cost, мінімальну, середню та максимальну тривалість
фільмів. */
SELECT  count(title) as Films,
min(rental_rate) as Min_Rental_rate,
max(rental_rate) as Max_Rental_rate,
avg(rental_rate) as AVG_Rental_rate,
avg(replacement_cost) as AVG_Replacement_cost,
min(length) as Min_Lenght,
avg(length) as AVG_Lenght,
max(length) as Max_Lenght
from sakila.film;

-- TASK  4;
--Виведіть кількість міст для кожної країни.
SELECT Country, count(city) as Cities_in_Country 
from sakila.city
join sakila.country using (country_id)
group by country_id;

-- TASK 5;
--Виведіть кількість фільмів знятих в кожній категорії.
SELECT name as Category, count(title) as Films  
FROM sakila.film
join sakila.film_category using(film_id)
join sakila.category using(category_id)
group by category_id;

-- TASK 6;
--Виведіть кількість акторів що знімалися в кожному фільмі.
SELECT f.title as Film ,
count(actor_id) as Actors 
FROM sakila.film_actor
join sakila.film as f using(film_id)
group by film_id;

-- TASK  7;
--Виведіть кількість акторів що знімалися в кожній категорії фільмів.
SELECT name as Category, count(actor_id) as Actors  
FROM sakila.film
join sakila.film_category using(film_id)
join sakila.category using(category_id)
join sakila.film_actor using(film_id)
group by category_id;

-- TASK  8;
--Виведіть district та кількість адрес для кожного district, 
--за умови, що district починається на “Central”.
SELECT District, count(address) as Address 
FROM sakila.address
where district like "Central%"
group by district
order by district;
