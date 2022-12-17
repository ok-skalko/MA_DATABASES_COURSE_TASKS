-- Task 1
-- Вивести адресу і місто до якого відноситься ця адреса,
-- у яких незаповнені phone або postal_code. (таблиці address, city).

-- JOIN
select a.address_id as 'ID', a.address as 'Address', c.city as 'City' from address a
join city c on c.city_id = a.city_id
where a.phone = '' or a.postal_code = ''
order by a.address_id;

-- SUB-QUERY
select
    a.address_id as 'ID',
    a.address as 'Address',
    (select c.city from city c where c.city_id = a.city_id) as 'City'
from address a
where a.phone = '' or a.postal_code = '';
