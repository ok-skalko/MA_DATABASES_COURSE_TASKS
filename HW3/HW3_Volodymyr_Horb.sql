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




















