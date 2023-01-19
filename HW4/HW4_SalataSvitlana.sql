--- Homework 4
---1---
	`actor_info` - Прізвище і імя актора та назва сюжета і фільму в якому він знімався.
	`customer_list` - Прізвище, імя клієнта та повна його контактна інформація ( адреса, місто, країна, телефон, індекс, статус)
    `film_list` - Повна інформація про фільм . Його Назва, опис, категорія, рейтинг, довжина, ціна та акторський склад.
    `nicer_but_slower_film_list` - Повна інформація про фільм . Його Назва, опис, категорія, рейтинг, довжина, ціна та акторський склад (Caps lock) .
    `sales_by_film_category` -  загальна сума за прокат по кожній категорії фільмів.
    `sales_by_store` - загальна сума на яку було здано фільмів в прокат кожним магазином та менеджером.
    `staff_list` - контактна інформація про менеджерів які працюють в магазинах. ( адреса, номер телефону, країна , магазин).
    
---2---
    Create view sakila.vw_film_actor as
    select  distinct f.title as film_name , concat(a.first_name, ' ' , a.last_name) as actor_full_name 
	from sakila.film_actor as fa join sakila.film as f
    on fa.film_id = f.film_id
	join sakila.actor as a
    on fa.actor_id = a.actor_id
    
---3--- 
    
	Create view sakila.vw_customer_info as
	select concat(sc.first_name, ' ' , sc.last_name ) as customer_full_name,
    sc.email as 'customer_email', 
    sa.address, 
    sa.district,
    sci.city, 
    sco.country
    from  sakila.customer as sc join sakila.address as sa
    on sc.address_id = sa.address_id
    join sakila.city as sci 
    on sa.city_id = sci.city_id
    join sakila.country as sco
    on sci.country_id = sco.country_id
    
---4---
	Create view sakila.vw_film_category_stats as
	select distinct sc.name as category_name , count(sf.film_id) as amount_of_films
    from sakila.category as sc  join sakila.film_category as sfc
    on sc.category_id = sfc.category_id
    join sakila.film as sf
	on sfc.film_id = sf.film_id
    group by sfc.category_id

---5---
	Create view sakila.vw_customer_top_payments as
    select concat(sc.first_name like '_','.',  sc.last_name ) as customer, sum(sp.amount) as total_amount
	from sakila.payment as sp
    join sakila.customer as sc
    on sp.customer_id = sc.customer_id
	group by sc.last_name
    having sum(sp.amount) > 190