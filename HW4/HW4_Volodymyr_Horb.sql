-- TASK  1;
--описати яку інформацію ви отримуєте з цих view, яка їх функція
actor_info - фільми в яких знімався кожний актор в розрізі категорій;
customer_list - контактна інформація по всім клієнтам;
film_list  - картотека фільмів (детальна інформація про фільми) 
nicer_but_slower_film_list - картотека фільмів v2 де Змінено регістр Імені + Прізвища 
sales_by_film_category -  сумарний дохід від продажів фільмів в розрізі категорій з спадаючим сортуванням
sales_by_store - дохід який принесли менеджери від продажів фільмів по крамницях
staff_list - контактна інформація по менеджерах
-- TASK  2;
/* Створіть view sakila.vw_film_actor з полями “actor_full_name”, “film_name”.
Використайте таблицю film_actor як основну, поле actor_full_name має бути
конкатенацією полів прізвище та ім’я актора. */
CREATE VIEW vw_film_actor as 
SELECT 
concat(sa.first_name, ' ' , sa.last_name) as actor_full_name,
sf.title as film_name,
sfa.last_update as last_update
FROM
sakila.film_actor as sfa
join sakila.actor as sa on sa.actor_id = sfa.actor_id
join sakila.film as sf on sf.film_id = sfa.film_id
-- TASK  3;
/*
Створіть view sakila.vw_customer_info з полями “customer_full_name”,
“customer_email”, “address”, “district”, “city”, “country”. Поле customer_full_name
має бути конкатенацією полів прізвище та ім’я користувача.
*/
CREATE VIEW vw_customer_info as 
SELECT 
concat(sc.first_name,' ' , sc.last_name) as customer_full_name,
sc.email as customer_email,
sa.address as address,
sa.district as district,
c.city as city,
cc.country as country
FROM
sakila.customer as sc
join sakila.address as sa on sa.address_id = sc.address_id
join sakila.city as c on sa.city_id = c.city_id
join sakila.country as cc on cc.country_id = c.country_id

-- TASK  4;
/* 
Створіть view sakila.vw_film_category_stats з полями “category_name”,
“amount_of_films”. Amount_of_films - це кількість фільмів, що є в кожній з
категорій фільмів.
 */
 CREATE VIEW vw_film_category_stats as 
SELECT 
sc.name as category_name,
count(sfc.film_id) as amount_of_films 
FROM
sakila.film_category as sfc
join sakila.category as sc on(sc.category_id = sfc.category_id)
group by sfc.category_id

-- TASK  5;
/* 
Створіть view sakila.vw_customer_top_payments з полями “customer”,
“total_amount”. За основу взяти таблицю sakila.payment. Total_amount - це
сума грошей, які заплатив кожен користувач. View має відображати лише
тих користувачів, що заплатили більше ніж 190 доларів. Customer - це
конкатенація першої літери імені та прізвища користувача. Наприклад Alan
Lipton має бути представлений як A. Lipton
*/
CREATE VIEW vw_customer_top_payments as 
SELECT
concat(left(sc.first_name,1),'. ' , sc.last_name) as customer,
sum(sp.amount) as total_amount
FROM
sakila.payment as sp
join sakila.customer as sc on (sc.customer_id = sp.customer_id)
group by sp.customer_id
having total_amount > 190
order by total_amount desc

