create database wallpaper;

use wallpaper;

create table materials (
    material_id int NOT NULL AUTO_INCREMENT,
    name varchar (255),
    PRIMARY KEY (material_id)
);

create table colors (
    color_id int NOT NULL AUTO_INCREMENT,
    name varchar (255),
    PRIMARY KEY (color_id)
);

create table production_lines (
    production_line_id int NOT NULL AUTO_INCREMENT,
    name varchar(255),
    location varchar(255),
    PRIMARY KEY (production_line_id)
);

create table customers (
    customer_id int NOT NULL AUTO_INCREMENT,
    first_name varchar (255),
    last_name varchar (255),
    phone varchar (255),
    address varchar (255),
    PRIMARY KEY (customer_id)
);

create table orders (
    order_id int NOT NULL AUTO_INCREMENT,
    customer_id int,
    production_line_id int,
    order_date datetime,
    PRIMARY KEY (order_id),
    FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
    FOREIGN KEY (production_line_id) REFERENCES production_lines (production_line_id)
);

create table articles (
    article_id int NOT NULL AUTO_INCREMENT,
    name varchar (255),
    material_id int,
    color_id int,
    PRIMARY KEY (article_id),
    FOREIGN KEY (material_id) REFERENCES materials (material_id),
    FOREIGN KEY (color_id) REFERENCES colors (color_id)
);

create table orders_articles (
    article_id int NOT NULL,
    order_id int NOT NULL,
    PRIMARY KEY (article_id, order_id),
    FOREIGN KEY (article_id) REFERENCES articles (article_id),
    FOREIGN KEY (order_id) REFERENCES orders (order_id)
);

insert into materials (name)
values
    ('fabric'),
    ('grasscloth'),
    ('paper'),
    ('vinyl'),
    ('wood');

insert into colors (name)
values
    ('Red'),
    ('IndianRed'),
    ('Pink'),
    ('DeepPink'),
    ('Coral'),
    ('Gold'),
    ('Yellow'),
    ('Lavender'),
    ('Magenta'),
    ('Indigo'),
    ('Purple'),
    ('SpringGreen'),
    ('Olive');

insert into articles (name, material_id, color_id)
values
    ('Red vinyl', 4, 1),
    ('Spring light', 5, 12),
    ('King', 2, 6),
    ('Flowers Lavender', 1, 8),
    ('Flowers Magenta', 1, 9),
    ('Flowers Lavender ECO', 3, 8),
    ('Flowers Magenta ECO', 3, 9);

insert into production_lines (name, location)
values
    ('Line 1', 'building 1-1'),
    ('Line 2', 'building 1-2'),
    ('Line 3', 'building 1-3'),
    ('Line 4', 'building 1-4'),
    ('Line 5', 'building 2-1'),
    ('Line 6', 'building 2-2'),
    ('Line 7', 'building 3'),
    ('Line 8', 'building 4');

insert into customers (first_name, last_name, phone, address)
values
    ('Nick', 'Smith', '123456789', '692 Joliet Street'),
    ('Jennifer', 'Chase', '123123123', '270 Amroha Parkway'),
    ('Cuba', 'Berry', '987654987', '1531 Sal Drive'),
    ('Joe', 'Wood', '875649333', '808 Bhopal Manor'),
    ('Bette', 'Mostel', '777888999', '770 Bydgoszcz Avenue'),
    ('Helen', 'Cage', '111222333', '320 Brest Avenue'),
    ('Dan', 'Torn', '333222111', '1688 Okara Way'),
    ('Elvis', 'Marx', '444555666', '18 Duisburg Boulevard'),
    ('Tim', 'Peck', '666555444', '33 Gorontalo Way'),
    ('Sissy', 'Bloom', '999888777', '176 Mandaluyong Place');

insert into orders (customer_id, production_line_id, order_date)
values
    (1, 6, '2015-04-03 14:00:45'),
    (2, 4, '2015-08-03 14:00:45'),
    (3, 1, '2015-11-06 14:00:35'),
    (4, 5, '2016-08-03 14:00:45'),
    (9, 2, '2017-08-03 14:00:45'),
    (7, 6, '2018-03-15 19:09:13'),
    (2, 3, '2018-07-22 11:30:17'),
    (8, 7, '2019-01-08 07:07:59'),
    (3, 8, '2019-09-02 16:02:52'),
    (4, 2, '2022-01-28 13:20:22'),
    (10, 1, curdate());

insert into orders_articles
values
    (4, 9),
    (2, 3),
    (6, 1),
    (7, 4),
    (6, 11),
    (6, 3),
    (3, 10),
    (1, 2),
    (5, 5),
    (7, 8);
