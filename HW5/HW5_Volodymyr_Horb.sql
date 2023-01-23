-- TASK  1
/* проаналізуйте таблиці country, city, film, film_category. Для
кожної таблиці вкажіть primary key, foreign key(s), а також тип зв’язку, який
утворюється за допомогою foreign key з іншою таблицею (one to one, one to
many, etc). */

sakila.country
pk_country_id  

sakila.city
pk_city_id  
fk_city_country_id
one to many

sakila.film
pk_film_id
fk_film_language
fk_film_laguage_original
one to many

sakila.film_category
pk_film_id, pk_category_id
fk_film_category_category
fk_film_category_film
one to many
-- TASK  2

https://drive.google.com/file/d/1dWBmXG5i_g33kpscppAi5ETeb715DRFS/view?pli=1

БД програми для гри в боулінг
містить таблиці 
Users - інформація про користувачів( гравців): ідентифікатор, Імя, Прізвище, Національність
Payments -  оплати участі в турнірах: ідентифікатор оплати ,який користувач, сума , дата оплати, проплачений турнір 
звязок     one to many
Tournaments -  список турнірів: ідентифікатор турніру, назва, інформація 
звязок     one to many
Games - перелік ігор: ідентифікатор гри, ідентифікатор гравця, ідентифікатор боулінг-центру, ідентифікатор-доріжки,
 результат, ідентифікатор турніру
 звязок     one to one
Alley_lines - ігрові доріжки в клубі: ідентифікатор доріжки, номер доріжки,ідентифікатор клубу
 звязок     one to many
 Bowling_alley - перелік клубів: ідентифікатор клубів,країна,адреса