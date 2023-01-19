--- 1----
select city,address
From sakila.city as sc join sakila.address as sa
on sc.city_id = sa.city_id
where sa.postal_code = '' or sa.phone = ''

select address , ( select city
From sakila.city as sс
where sс.city_id = sa.city_id) as city
from sakila.address as sa
where sa.postal_code = '' or sa.phone = ''


     
---2---
select  distinct city 
from sakila.country as country 
join sakila.city as city
on country.country_id = city.country_id
where country = "Argentina" or country = "Austria"
order by city city

select city
from sakila.city
where country_id in ( select country_id
from sakila.country
where country = 'Argentina' or country = 'Austria')
order by city
            

---3---
Select*
from sakila.actor
where actor_id in (Select actor_id
from sakila.film_actor 
where film_id in (Select film_id
from sakila.film_category
where category_id  in (Select category_id
from sakila.category
where name = 'Music' or name = 'Sports'
)))

Select  distinct sa.actor_id, sa.first_name, sa.last_name
from sakila.actor as sa
join sakila.film_actor as sfa
on sa.actor_id = sfa.actor_id
join sakila.film_category as sfc
on sfa.film_id =  sfc.film_id
join sakila.category as sc
on sfc.category_id = sc.category_id
where sc.name = 'Music' or sc.name = 'Sports'


---4---

select distinct first_name,last_name
from sakila.customer as sc
join sakila.rental as sr
on sc.customer_id = sr.customer_id
where return_date is null

select first_name,last_name
from sakila.customer
where customer_id in ( select customer_id
from sakila.rental 
where return_date is null)


---5----
select  film_id, title
from sakila.film
where film_id in (select film_id
from sakila.inventory
where store_id in ( select store_id
from sakila.staff
where first_name = 'Mike' and last_name = 'Hillyer'))

select distinct sf.film_id , sf.title
from sakila.film as sf
join sakila.inventory as sk
on sf.film_id = sk.film_id
join sakila.staff as ss
on sk.store_id = ss.store_id
where  first_name = 'Mike' and last_name = 'Hillyer'


----6----
select*
from sakila.customer
where customer_id in (SELECT customer_id
 FROM sakila.rental 
 where inventory_id in (SELECT inventory_id
 FROM sakila.inventory
 where film_id in (select film_id
from sakila.film 
where title in ('SWEETHEARTS'
'SUSPECTS', 'TEEN APOLLO', 'TIMBERLAND SKY', 'TORQUE BOUND')
)))

select distinct *
from sakila.customer as sc
join  sakila.rental as sr 
on sc.customer_id = sr.customer_id
join sakila.inventory as si
on sr.inventory_id = si.inventory_id
join sakila.film  as sf
on si.film_id = sf.film_id
where title in ('SWEETHEARTS'
'SUSPECTS', 'TEEN APOLLO', 'TIMBERLAND SKY', 'TORQUE BOUND')

---7---

select distinct title 
from sakila.film as sf 
join sakila.inventory as si
on sf.film_id = si.film_id
join sakila.rental as sr
on si.inventory_id= sr.inventory_id
where sr.return_date is null and sf.replacement_cost > 10;

select title 
from sakila.film 
where film_id in ( select film_id
from sakila.inventory 
where inventory_id in ( select inventory_id
from sakila.rental 
where  return_date is null and replacement_cost > 10
))


---8---
SELECT distinct first_name, last_name, payment_date, amount
FROM sakila.customer as sc 
join sakila.payment as sp
on sc.customer_id = sp.customer_id
where amount >10
order by payment_date
 

	select 
		sp.payment_date, sp.amount,
		(select sc.first_name,
		from sakila.customer as sc
		where sc.customer_id = sp.customer_id) as 'first name', 
		(select c.last_name, 
		from sakila.customer as sc
		where sc.customer_id = sp.customer_id) as 'last name', 
	from sakila.payment as sp
	where sp.amount > 10
	order by sp.payment_date
    
    
select 	first_name, last_name, payment_date, amount
from sakila.customer 
where customer_id in (select customer_id 
from sakila.payment
where amount> 10)
order by payment_date;




