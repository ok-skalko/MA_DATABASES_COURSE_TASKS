-- Task 1
-- 1
select a.address, c.city
from sakila.address as a
join sakila.city as c
on a.city_id = c.city_id
where a.postal_code = '' or a.phone = '';

-- 2
select
    a.address,
    (select c.city from sakila.city as c where c.city_id = a.city_id) as city
from sakila.address as a
where a.postal_code = '' or a.phone = '';

-- Task 2
-- 1
select city
from sakila.city
where country_id in (
    select country_id
    from sakila.country
    where country in ('Argentina', 'Austria')
)
order by city;

-- 2
select c.city
from sakila.city as c
join sakila.country as c2
on c.country_id = c2.country_id
where c2.country in ('Argentina', 'Austria')
order by city;

-- Task 3
-- 1
select first_name, last_name
from sakila.actor
where actor_id in (
    select distinct actor_id
    from sakila.film_actor
    where film_id in (
        select film_id
        from sakila.film_category
        where category_id in (
            select category_id
            from sakila.category
            where name in ('Music', 'Sports')
        )
    )
);

-- 2
select distinct a.first_name, a.last_name
from sakila.actor as a
join sakila.film_actor as f_a on a.actor_id = f_a.actor_id
join sakila.film_category as f_c on f_a.film_id = f_c.film_id
join sakila.category as c on f_c.category_id = c.category_id
where c.name in ('Music', 'Sports');

-- Task 4
-- 1
select first_name, last_name
from sakila.customer
where customer_id in (
    select distinct customer_id
    from sakila.rental
    where return_date is null
);

-- 2
select distinct c.first_name, c.last_name
from sakila.customer as c
join sakila.rental as r
on c.customer_id = r.customer_id
where r.return_date is null;

-- Task 5
-- 1
select title
from sakila.film
where film_id in (
    select distinct film_id
    from sakila.inventory
    where inventory_id in (
        select staff_id
        from sakila.staff
        where first_name = 'Mike' and last_name = 'Hillyer'
    )
);

-- 2
select distinct f.title from sakila.film as f
join sakila.inventory as i on f.film_id = i.film_id
join sakila.staff as s on i.inventory_id = s.staff_id
where s.first_name = 'Mike' and s.last_name = 'Hillyer';

-- Task 6
-- 1
select first_name, last_name
from sakila.customer
where customer_id in (
    select distinct customer_id
    from sakila.rental
    where inventory_id in (
        select inventory_id
        from sakila.inventory
        where film_id in (
            select film_id
            from sakila.film
            where title in ('SWEETHEARTS SUSPECTS', 'TEEN APOLLO', 'TIMBERLAND SKY', 'TORQUE BOUND')
        )
    )
);

-- 2
select distinct c.first_name, c.last_name from sakila.customer as c
join sakila.rental as r on c.customer_id = r.customer_id
join sakila.inventory as i on r.inventory_id = i.inventory_id
join sakila.film as f on i.film_id = f.film_id
where title in ('SWEETHEARTS SUSPECTS', 'TEEN APOLLO', 'TIMBERLAND SKY', 'TORQUE BOUND');

-- Task 7
-- 1
select title from sakila.film
where replacement_cost > 10 and film_id in (
    select film_id
    from sakila.inventory
    where inventory_id in (
        select inventory_id
        from sakila.rental
        where return_date is null
    )
);

-- 2
select f.title from sakila.film as f
join sakila.inventory as i on f.film_id = i.film_id
join sakila.rental as r on i.inventory_id = r.inventory_id
where f.replacement_cost > 10 and r.return_date is null;

-- Task 8
select c.first_name, c.last_name, p.amount, p.payment_date
from sakila.customer as c
join sakila.payment as p on c.customer_id = p.customer_id
where p.amount > 10
order by p.payment_date;