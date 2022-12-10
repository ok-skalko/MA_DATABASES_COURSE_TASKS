# 1
select *
from customer
limit 100;

# 2
select first_name as 'First Name',
       last_name  as 'Last Name',
       email      as 'Email'
from customer;

# 3
select address     as 'Address',
       district    as 'District',
       postal_code as 'Postal Code'
from address
order by district, address desc;

# 4
select title       as 'Title',
       rental_rate as 'Rental Rate'
from film
where rental_rate > 3;

# 5
select title       as 'Title',
       description as 'Description',
       rating      as 'Rating'
from film
where rating in ('G', 'PG', 'R');

# 6
select *
from film
where rental_duration = 3
  and replacement_cost < 12;

# 7
select *
from film
where rating = 'G'
  and replacement_cost > 15;

# 8
select *
from film
where length between 60 and 90;
