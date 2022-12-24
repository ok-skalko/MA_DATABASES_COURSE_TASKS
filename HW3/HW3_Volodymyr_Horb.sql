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




















