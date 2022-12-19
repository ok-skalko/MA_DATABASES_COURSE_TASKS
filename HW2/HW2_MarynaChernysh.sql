"TASK1"

select city, address  from sakila.address
join sakila.city using (city_id)
where phone="" or postal_code = "";


select  address from sakila.address
where address_id in  (
 select address_id  from sakila.city
 where phone="" or postal_code = ""
                );

"Task2"

select  city from  sakila.city as ci
join  sakila.country as cou  on cou.country_id=ci.country_id
where country = "Argentina" or country = "Austria"
order by city asc;


select   city from sakila.city
where country_id in (
   select country_id from sakila.country
   where country = "Argentina" or country = "Austria"
                    )
order by city asc;


'Task3'


select distinct first_name, last_name from sakila.actor
join sakila.film_actor using (actor_id)
join sakila.film_category using(film_id)
join sakila.category using(category_id)
where name="Music" or name="Sports";



select first_name, last_name from sakila.actor
where actor_id in (
    select actor_id from sakila.film_actor
	where film_id in (
        select film_id from sakila.film_category
        where category_id in (
            select  category_id from sakila.category
            where name="Music" or name="Sports"
                             )
					)
			    );
                
                
"Task4"

select first_name, last_name, email from sakila.customer
where customer_id in (
  select customer_id from sakila.rental
   where return_date is Null        )
order by last_name;

select distinct first_name, last_name, email from sakila.customer as CU
join sakila.rental as RE on RE.customer_id = CU.customer_id
where return_date is Null        
order by last_name;


"Task 5"

select distinct title from sakila.film
where film_id in (
select film_id from sakila.inventory 
 where store_id in (
 select store_id from sakila.store
  where manager_staff_id in (
    select manager_staff_id from sakila.staff
    where first_name = 'Mike' and last_name = 'Hillyer'
                    )
				)
              )
order by title;
                
select  distinct title from sakila.film
join sakila.inventory using(film_id)
join sakila.store using(store_id)
join sakila.staff on  store.manager_staff_id = staff.staff_id
where first_name = 'Mike' and last_name = 'Hillyer'
order by title;

"Task 6"

Select distinct first_name, last_name from sakila.customer
join sakila.inventory using (store_id)
Join sakila.film using (film_id)
where (title = "SWEETHEARTS SUSPECTS" or title = "TEEN APOLLO" or title  = "TIMBERLAND SKY" or title ="TORQUE BOUND")
order by first_name ;

select  distinct first_name, last_name from sakila.customer
where store_id in (
   select store_id from sakila.inventory
   where film_id in ( 
      select film_id from sakila.film
      where (title = "SWEETHEARTS SUSPECTS" or title = "TEEN APOLLO" or title  = "TIMBERLAND SKY" or title ="TORQUE BOUND")
                     )
                   )
order by first_name ;




"Task7"


select distinct title from sakila.film 
Join sakila.inventory using (film_id)
join sakila.rental using (inventory_id)
where replacement_cost>10 and return_date is null;

select title from sakila.film
where film_id in (
  select film_id from sakila.inventory
  where inventory_id in (
     select inventory_id from sakila.rental
     where replacement_cost>10 and return_date is null
                        )
				 );
                 

"Task8"

select 	first_name, last_name, payment_date, amount
from sakila.customer 
where customer_id in (
select customer_id from sakila.payment
 where amount> 10
                    )
order by payment_date;

 
 
select 	first_name, last_name, payment_date, amount
from sakila.customer 
join sakila.payment using(customer_id )
where amount>10
order by payment_date;