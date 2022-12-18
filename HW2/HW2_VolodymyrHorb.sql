-- TASK  1;



--v2 join
SELECT address, city
 FROM sakila.address as sa
join sakila.city as sc on sc.city_id=sa.city_id
where  address2 is null

-- TASK  2;
select 
  city 
from 
  sakila.city 
where 
  country_id in (
    select 
      country_id 
    from 
      sakila.country 
    where 
      country like "Argentina" 
      or country like "Australia"
  ) 
order by 
  city asc;

--v2 join
select 
  city 
from 
  sakila.city as sca 
  join 
    sakila.country as sco 
  on sca.country_id = sco.country_id 
where 
  country like "Argentina" 
  or country like "Australia" 
order by 
  city asc;

-- TASK  3;
select DISTINCT
  first_name, 
  last_name 
from 
  sakila.actor 
where 
  actor_id in (
    select 
	actor_id 
    from 
      sakila.film_actor 
    where 
      film_id in(
        select 
          film_id 
        from 
          sakila.film_category 
        where 
          category_id in (
            select 
              category_id 
            from 
              sakila.category 
            where 
              name like "Music" 
              or name like "Sports"
          )
      )
  )
--V2 join
select DISTINCT
  first_name, 
  last_name  
from 
  sakila.actor as a 
  join sakila.film_actor as fa on fa.actor_id = a.actor_id
  join sakila.film_category as fc on fc.film_id = fa.film_id
  join sakila.category as c on c.category_id = fc.category_id
where 
  name like "Music" 
  or name like "Sports";


-- TASK  4;
select first_name, 
last_name 
from sakila.customer
where customer_id  in (
	select distinct customer_id 
	from sakila.rental
	where return_date is null
)
--v2 join
select DISTINCT 
first_name, last_name
from sakila.customer as sc
join sakila.rental as sr
on sc.customer_id = sr.customer_id
where return_date is null;

-- TASK 5;



-- TASK 6;
SELECT 
  first_name, 
  last_name 
FROM 
  sakila.customer 
where 
  customer_id in (
    SELECT 
      customer_id 
    FROM 
      sakila.rental 
    where 
      inventory_id in(
        SELECT 
          inventory_id 
        FROM 
          sakila.inventory 
        where 
          film_id in(
            SELECT 
              film_id 
            FROM 
              sakila.film 
            where 
              title in (
                "SWEETHEARTS SUSPECTS", "TEEN APOLLO", 
                "TIMBERLAND SKY", "TORQUE BOUND"
              )
          )
      )
  )
  
  --v2 join
  
  select DISTINCT
	first_name,
    last_name
   from sakila.customer as sc
   join sakila.rental  as sr on sc.customer_id = sr.customer_id
   join sakila.inventory as si on si.inventory_id = sr.inventory_id
   join sakila.film as sf on sf.film_id = si.film_id
   where sf.title in (
   "SWEETHEARTS SUSPECTS", "TEEN APOLLO", 
                "TIMBERLAND SKY", "TORQUE BOUND"
   );

-- TASK  7;

select 
  distinct title 
from 
  sakila.film 
where 
  replacement_cost > 10 
  and film_id in (
    select 
      film_id 
    from 
      sakila.inventory 
    where 
      inventory_id in (
        SELECT 
          inventory_id 
        FROM 
          sakila.rental 
        where 
          return_date is null
      )
  )

--v2 join
SELECT  DISTINCT
title
 FROM sakila.film as sf
join sakila.inventory as si on si.film_id = sf.film_id
join sakila.rental as sr on sr.inventory_id = si.inventory_id
where return_date is null and replacement_cost > 10;


-- TASK  8;
select
(select c.first_name from customer as c
        where c.customer_id = sp.customer_id
    ) as 'First Name',
    (
        select c.last_name from customer as c
        where c.customer_id = sp.customer_id
    ) as 'Last Name',
sp.amount as Amount,
sp.payment_date as Payment_date
from sakila.payment as sp
where sp.amount > 10
order by sp.payment_date


--v2 join
select 
	first_name,
	last_name,
    amount,
    payment_date
from sakila.customer as sc
join sakila.payment as sp  on sp.customer_id = sc.customer_id
where amount > 10
order by payment_date asc

