create database coffee_vending;
use coffee_vending;


create table coffee_machine ( 
coffee_machine_id int not null,
coffee_machine_name varchar(255),
trading_point_id int not null,
number_drinks int, 
service_time float,
primary key (coffee_machine_id),
foreign key (trading_point_id) references trading_point(trading_point_id)
);




drop table coffee_machine;


select * from coffee_machine;

insert into coffee_machine
values 
(1, 'Necta Kikko es6', 2,  10,  1.4),
(2, 'Fas Perla', 1,  12,  1.3),
(3, 'Saeco cristalo 400', 4,  10,  0.6),
(4, 'Saeco cristalo 400', 6,  10,  1.3),
(5, 'Necta Kikko es6', 3,  10,  1.1),
(6, 'Fas Fashion', 8,  12,  0.5),
(7, 'Fas Perla', 1,  12,  1.3),
(8, 'Fas Fashion', 7,  12,  0.8)
;

select * from coffee_machine;

'drinks'

create table drinks (
drinks_id  int,
coffee_machine_id int not null,
volume float, 
price  float not null,
check(price  > 10),
primary  key (drinks_id),
foreign key (coffee_machine_id) references coffee_machine (coffee_machine_id)
);

alter table drinks
add column name_of_drinks varchar(25);

alter table drinks
modify column name_of_drinks varchar(25) unique;

insert into drinks (drinks_id, name_of_drinks, coffee_machine_id, volume, price)
values
(1, 'Espresso', 1, 70, 18),
(2, 'Americano', 1, 130, 19),
(3, 'Capuccino', 1, 160, 22),
(4, 'Vanila coffee', 1, 160, 15),
(6, 'Double Espresso', 1, 150, 22),
(7, 'Espresso with milk', 1, 180, 22),
(8, 'Americano with milk', 1, 200, 25),
(9, 'Mocachino', 1, 200, 25),
(10, 'Chocolate', 1, 200, 20)
;

select * from drinks;

drop table drinks;


'trading point'

create table trading_point (
trading_point_id int,  
coffee_machine_id int,
city varchar(50),
address varchar(50) not null,
phone_number varchar(20),
manager_id int,
primary key (trading_point_id),
foreign key (manager_id) references managers (manager_id)
);

alter table trading_point
modify column trading_point_id int auto_increment;

drop table trading_point;
 
insert into trading_point (coffee_machine_id, city, address, phone_number, manager_id)
values 
 (1, 'Sofiivska Borshchagivka', 'Zhulinaska, 10',  '636894561', 4),
 (3, 'Kyiv', 'Peremogy, 49', 668975214 , 5),
 (4, 'Vushneve', 'Sviatoshinska, 26', '672589614' , 3),
 (5, 'Kyiv', 'Ostrivna, 9', '663955278', 2),
 (6, 'Chabany', 'Shevchenka, 12', '673984516', 6),
 (7, 'Kyiv', 'Ostrivna ,9', '663955278', 2),
 (8, 'Hotiv', 'Jevopeyska, 27', '986741278', 7),
 (9, 'Vushneve', 'Sviatoshinska 26', '672589614', 3)
  ;
 
select * from trading_point ;
 
 
'managers'

create table managers (
manager_id  int, 
trading_point_id  int,
first_name varchar(55) not null,
last_name varchar(55),
phone_number_1 varchar(20) not null,
phone_number_2 varchar(20),
primary key (manager_id)
);


 insert into managers
values
 (1, 1, 'Dmytro', 'Chyzh', '682093541', '682093544'),
 (2, 3, 'Serhiy' , 'Volynec', '663955278' , '663955267'),
 (3, 5, 'Ihor' , 'Kondratiuk', '672589614', '672589617'),
 (4, 2, 'Artem' , 'Kovalec', '636894561', '636894562'),
 (5, 4, 'Andrii' , 'Vakarchuk', '668975214', '668975215'),
 (6, 8, 'Tetiana', 'Lysycia', '673984516', '673984518'),
 (7, 9, 'Olga' , 'Kruta', '986741278', '986741274')
 ;
 
 select * from managers;
 
 drop table managers;
 
 create table service (
 service_id int,
 date_service date,
 coffee_machine_id int not null,
 amount_income float,
 amount_spends float,
 check(amount_income > 0),
 check(amount_spends > 0),
  primary key (service_id),
 foreign key (coffee_machine_id) references  coffee_machine(coffee_machine_id)
  );
 
 
  'check на коректність дати сервісу і сьогоднішньої дати '
  
 insert into service 
 value 
 (1, '2023-01-25', 3, 568, 357),
 (2, '2023-01-27', 2, 1245, 875),
 (3, '2023-01-15', 7, 489, 200),
 (4, '2022-12-28', 3, 1500, 689),
 (5, '2022-11-28', 4, 349, 12),
 (6, '2023-01-25', 8, 783, 245),
 (7, '2023-01-25', 1, 1200, 698),
 (8, '2023-01-25', 1, 1023, 225),
 (9, '2023-01-25', 5, 38, 691),
 (10, '2023-01-25', 6, 1785, 986);
 
 
 select * from service
 join coffee_machine using (coffee_machine_id) ;
 
 drop table service;
 
 
 create table suppliers (
 suppliers_id int auto_increment,
 first_name varchar(55) not null,
 last_name varchar(55),
 phone_number varchar(20) not null, 
 email varchar(55) unique,
 order_id int not null,
 adress varchar(155),
 primary key (suppliers_id),
 foreign key (order_id) references orders (order_id)
   );
   
drop table suppliers;

insert into suppliers (first_name, last_name, phone_number, email, order_id, adress)
values
       ('Tereshchenko', ' Ruslan' , '0663585978' , 'rteshc@gmail.com', 1, 'Kyiv, Klavdiivdka 24' ),
       ('Bilyk', ' Igor' , '0678925646' , 'morephone@gmail.com', 2, 'Kyiv, Pyrogova 76' ),
       ('Cilyk', 'Iryna' , '0662347985' , 'mechanic@ukr.net', 6, '' ),
       ('Matiash', ' Viktor' , '06734567890' , 'bigvik@gmail.com', 4, 'Kyiv, Saksaganskogo 10' ),
       ('Styk', ' Lev' , '0985261479' , 'coffee@dot.com', 7, 'Kyiv, Vesniaha, 13' ),
       ('Tychyna', ' Pavlo' , '0689782365' , 'dendy@bom.com', 10, 'Lviv, Franka 19' ),
       ('Korsyk', ' Olena' , '0639856214' , 'Olenka_28@gmail.com', 8, 'Vinnutsia, Holovna 1' ),
       ('Farion', ' Irena' , '0639856214' , 'nirusni@gmail.com', 3, '' ),
       ('Movchan', ' Oleksandr' , '0506397825' , 'stakany@gmail.com', 9, 'Brovary,  Zelana 67' ),
       ('Ostannia', ' Tetiana' , '0506397777' , 'voda@ukr.net', 5, 'Brovary,  Zelana 67' )
       ;
 
 select * from suppliers;
 
 create table orders (
 order_id int auto_increment,
 date_of_order date,
 name_of_product varchar(55) not null,
 quantity float,
 price float, 
 check(quantity > 0),
 check(price > 0),
  primary key (order_id)
 );
 
  
 insert into orders (date_of_order, name_of_product, quantity, price )
 values
 ('2022-12-25' , 'Coffee Lavazza', 10, 3250 ),
 ('2022-12-22' , 'Vanilla', 5, 3350 ),
 ('2022-12-15' , 'Chocolate', 7, 2352),
 ('2023-01-14' , 'Coffee Pozitive', 15, 3698),
 ('2023-01-05' , 'Lemon Tea', 10, 1888),
 ('2023-01-25' , 'Sticks', 500, 230),
 ('2023-01-16' , 'Cups_200', 1000, 520),
 ('2022-11-28' , 'Sugar', 10, 430),
 ('2022-12-15' , 'Milk', 7, 1502);
 
 select * from orders;
  drop table orders;
 
  insert into orders (date_of_order, name_of_product, quantity, price )
 values
 ('2022-12-25' , null, 10, 3250 );
 
 
 create table revenue (
 revenue_id int auto_increment, 
 order_id int,
 service_id int,
 date_of_report date not null,
 primary key (revenue_id),
 foreign key (order_id) references orders(order_id),
 foreign key (service_id) references service(service_id)
 );
 
  
 Insert into revenue (order_id, service_id,  date_of_report)
 values
 ( 3,  1, '2023-01-26' ),
 ( 4,  2, '2023-01-20' ),
 ( 8,  6, '2023-01-27' ),
 ( 9,  5, '2022-11-28' ),
 ( 5,  9, '2023-01-19' ),
 ( 2,  8, '2023-01-13' ),
 ( 1,  4, '2023-01-25' ),
 ( 7,  5, '2023-01-25' ),
 ( 6,  2, '2023-01-25' )
  ;
 
 select * from revenue
 join service using (service_id);
 
  
