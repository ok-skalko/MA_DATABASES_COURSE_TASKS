select address,city from sakila.address,(select * from sakila.city) as c
where sakila.address.city_id in(select c.city_id from sakila.city
where sakila.address.phone=0 and sakila.address.postal_code=0 ) 

select address,city
from sakila.address ,
(select * from sakila.city) as c
where sakila.address.city_id = c.city_id and sakila.address.phone=0 and sakila.address.postal_code=0;

select address,city from sakila.address as adres
join sakila.city as city on adres.city_id=city.city_id
where phone=0 and postal_code=0 


select city from sakila.city,(select * from sakila.country) as county
where sakila.city.country_id in(select county.country_id from sakila.country 
where county.country="Austria" or county.country="Argentina" )
order by city

select city from sakila.city,(select * from sakila.country)as county
where sakila.city.country_id=county.country_id and( county.country="Argentina" or county.country="Austria")
order by city

select city from sakila.city as c
join sakila.country as con on c.country_id=con.country_id
where country = "Argentina" or country="Austria"

select distinct first_name as "First name",last_name as "Last name" from sakila.actor,(select * from sakila.film_actor)as fact
where sakila.actor.actor_id in(
select  sakila.film_actor.actor_id from sakila.film_actor where film_id in(
select film_id from sakila.film_category where category_id in(
select category_id from sakila.category where name="Music" or name="Sports" )))
order by first_name

select distinct first_name as "First name",last_name as "Last name" from sakila.actor as act
join sakila.film_actor as fa on act.actor_id=fa.actor_id
join sakila.film_category as fcat on fa.film_id=fcat.film_id
join sakila.category as categ on fcat.category_id=categ.category_id
where name="Music" or name="Sports"
order by first_name

select first_name as "First name",last_name as "Last name",email as "Email" from sakila.customer,(select * from sakila.rental)as rent
where sakila.customer.customer_id in(
select rent.customer_id from sakila.rental where rent.return_date is null)
order by email

select first_name as "First name",last_name as "Last name",email as "Email" from sakila.customer as customer
join sakila.rental as rent on customer.customer_id=rent.customer_id
where return_date is null
order by email

select  title as "Title film" from sakila.film where film_id in(
select film_id from sakila.inventory where inventory_id in(
select inventory_id from sakila.rental where staff_id in(
select staff_id from sakila.staff where first_name="Mike")))
order by title

select distinct title from sakila.film as f
join sakila.inventory as inv on f.film_id=inv.film_id
join sakila.rental as r on inv.inventory_id=r.inventory_id
join sakila.staff as st on r.staff_id=st.staff_id
where st.username="Mike"
order by title 
 
 -- select  first_name from sakila.customer where customer_id in(
 select customer_id from sakila.rental where inventory_id in(
 select inventory_id from sakila.inventory where film_id in(
 select film_id from sakila.film where title in("TEEN APOLLO","SWEETHEARTS SUSPECTS","TIMBERLAND SKY","TORQUE BOUND"))) )
 order by first_name
 
 select first_name from sakila.customer as customer
 join sakila.rental as rent on customer.customer_id=rent.customer_id
 join sakila.inventory as inv on rent.inventory_id=inv.inventory_id
 join sakila.film as f on inv.film_id=f.film_id
 where title in("TEEN APOLLO","SWEETHEARTS SUSPECTS","TIMBERLAND SKY","TORQUE BOUND")
 order by first_name


select title from sakila.film where film_id in(
select film_id from sakila.inventory where inventory_id in(
select inventory_id from sakila.rental where return_date is null and replacement_cost>10))

select title from sakila.film as f
join sakila.inventory as inv on f.film_id=inv.film_id
join sakila.rental as rent on inv.inventory_id=rent.inventory_id
where return_date is null and replacement_cost>10


 select first_name as "First name",payment_date as "Payment date",amount as "Amount" from sakila.customer,
(select * from sakila.payment) as pay
where sakila.customer.customer_id = pay.customer_id and amount>10
order by payment_date

 select first_name as "First name",payment_date as "Payment date",amount as "Amount" from sakila.customer as custom
 join sakila.payment as p on custom.customer_id=p.customer_id
 where amount >10
 order by payment_date
 
 
 
 


