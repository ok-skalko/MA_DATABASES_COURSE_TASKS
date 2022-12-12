select * from sakila.customer;

select first_name as "First Name", last_name as "Last Name",email as "Email" from sakila.customer;

select address as "Address",district as "District",postal_code as "Postal code" from sakila.address
order by  district ,address desc ;

select title as "Title film",rental_rate as "Rental" from sakila.film
where rental_rate > 3 ;

select title as "Title film",description as "Description",rating as "Rating film" from sakila.film
where rating in("R","G","PG");

select title as "Title",description as "Description",rental_duration as "Rental duration",replacement_cost as "Cost" from sakila.film
where rental_duration=3 and replacement_cost>12;

select title as "Title",description as "Description",rating as "Rating",replacement_cost as "Cost" from sakila.film
where rating="G" and replacement_cost>15;

select * from sakila.film
where length between 60 and 90;

