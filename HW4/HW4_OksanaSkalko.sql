-- Task 1
"actor_info - містить інформацію про акторів - ім'я, прізвище і фільми в яких вони знімались, згруповані по категоріям"
"customer_list - містить інформацію по клієнтам - адресу, телефон, активний чи неактивний і в якому магазині"
"film_list - містить інформацію про фільми - категорію, опис, рейтинг, актори, ціна і тривалість"
"nicer_but_slower_film_list - також повна інформація про фільми, але імена акторів написані в іншому регістрі"
"sales_by_film_category - сумарний дохід по кожній категорії фільмів із сортуванням доходу за спаданням"
"sales_by_store - загальний дохід по кожному магазину із вказанням імені менеджера"
"staff_list - містить інформацію по працівникам - адреса, телефон та id магазину де вони працюють"

-- Task 2
create view sakila.vw_film_actor as
select
    concat(a.first_name, ' ', a.last_name) as 'actor_full_name',
    f.title as 'film_name'
from sakila.actor as a
join sakila.film_actor as fa on a.actor_id = fa.actor_id
join sakila.film as f on fa.film_id = f.film_id;

-- Task 3
create view sakila.vw_customer_info as
select
    concat(c.first_name, ' ', c.last_name) as 'customer_full_name',
    c.email as 'customer_email',
    a.address as 'address',
    a.district as 'district',
    c2.city as 'city',
    c3.country as 'country'
from sakila.customer as c
join sakila.address as a on c.address_id = a.address_id
join sakila.city as c2 on a.city_id = c2.city_id
join sakila.country as c3 on c2.country_id = c3.country_id;

-- Task 4
create view sakila.vw_film_category_stats as
select
    c.name as 'category_name',
    count(fc.film_id) as 'amount of films'
FROM sakila.film_category as fc
join sakila.category as c on fc.category_id = c.category_id
group by fc.category_id;

-- Task 5
create view sakila.vw_customer_top_payments as
select
    concat(left(c.first_name, 1), '. ', c.last_name) as 'customer',
    sum(p.amount) as 'total_amount'
FROM sakila.customer as c
join sakila.payment as p on c.customer_id = p.customer_id
group by p.customer_id
having sum(p.amount) > 190;
