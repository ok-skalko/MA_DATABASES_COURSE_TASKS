
-- Table sakila.country:
-- PK country_id;

-- Table sakila.city:
-- PK city_id ;
-- FK country_id;
-- Relation many-to-one(one country has mane cities, but one city has only one countrty).

-- Table sakila.film:
-- PK film_id;
-- FK : language_id,original_language_id.
--  
-- Table sakila.film_category:
-- PK : film_id and category_id
-- FK: film_category_category,film_category_film
-- Relation one-to-many(one film has one category,but one category has many films).


