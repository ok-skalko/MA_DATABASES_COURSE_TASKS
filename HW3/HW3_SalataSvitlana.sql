---1---
select title, rating
from sakila.film
where description like '% database%';

--- 2---
select first_name, last_name
from sakila.film as sf join sakila.film_actor as sfa
on sf.film_id = sfa.film_id
join sakila.actor as sa
on sfa.actor_id = sa.actor_id
where sf.rating = 'G' and sf.description like '% cat%';

---3---
select 
	count(film_id) as 'count film',
	 avg(rental_rate) as 'avg rental rate', 
	 min(rental_rate) as 'min rental rate', 
	 max(rental_rate) as 'max rental rate', 
	 avg(replacement_cost) as  'avg cost', 
	 min(length) as 'min length' , 
	 max(length) as 'max length'
from sakila.film ;

---4---
select country.country, count(city.city) as 'count city'
from sakila.country as country 
join sakila.city as city
on country.country_id = city.country_id
group by country.country;

---5---
select sc.name,count(sf.film_id) as 'count film'
from sakila.film as sf  
join sakila.film_category as sfl
on sf.film_id = sfl.film_id
join sakila.category as sc
on sfl.category_id = sc.category_id
group by sc.name;


---6---
select sf.title, count(sfa.actor_id) as 'count actor in film'
from sakila.film as sf 
join sakila.film_actor as sfa
on sf.film_id = sfa.film_id 
group by sf.title;


---7---
select sc.name, count(sfa.actor_id) as 'count actor in category'
from sakila.film_actor as sfa 
join sakila.film_category as sfc
on sfa.film_id = sfc.film_id 
join sakila.category as sc
on sfc.category_id = sc.category_id
group by sc.name;

---8---
select district, count(address) as ' count address'
from sakila.address
where district like 'Central%' 
group by district

---9--
select ss.store_id, sc.active, count(customer_id)
from sakila.customer as sc
join sakila.store as ss
on sc.store_id = ss.store_id
group by sc.active, ss.store_id

---10---
select sc.first_name, sc.last_name, min(sp.payment_date) as 'min payment_date', max(sp.payment_date) as 'max payment_date', sum(amount) as ' total amount'
from sakila.customer as sc
join sakila.payment as sp
on sc.customer_id = sp.customer_id
group by sc.customer_id

---11--
select  title as Film,  sum(amount) as 'total amount'
from sakila.film as sf
join sakila.inventory as si 
on sf.film_id = si.film_id
join sakila.rental as sr
on si.inventory_id = sr.inventory_id
join sakila.payment as sk
on sr.rental_id = sk.rental_id
group by sf.title

---12---
select *
from sakila.film 
where length in (select max(length)
from sakila.film)
