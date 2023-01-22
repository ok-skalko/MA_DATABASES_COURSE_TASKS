/* CREATING */

use bowling_app;
create table  users (
user_id int auto_increment primary key,
last_name varchar(50) NOT NULL,
first_name varchar(50) NOT NULL,
birthday date NOT NULL,
email varchar(50) unique NOT NULL,
nationality varchar(50)
);

create table  tournaments (
tournament_id int auto_increment primary key,
title varchar(255) NOT NUll,
information text
);

create table  payments (
payment_id int auto_increment primary key,
user_id int NOT NULL,
amount decimal(5,2) NOT NULL,
payment_date datetime NOT NULL,
tournament_id int NOT NULL,
foreign key (user_id) references users(user_id),
foreign key (tournament_id) references tournaments(tournament_id)
);

create table  bowling_alley (
alley_id int auto_increment unique primary key,
country varchar(255) NOT NUll,
address varchar(255) NOT NUll
);

create table  alley_lines (
line_id int auto_increment unique primary key,
line_num int NOT NUll,
alley_id int NOT NUll,
foreign key (alley_id) references bowling_alley(alley_id)
);

create table  games (
game_id int auto_increment primary key,
user_id int NOT NULL,
alley_id int NOT NULL,
line_id int NOT NULL,
score int,
tournament_id int NOT NULL,
foreign key (user_id) references users(user_id),
foreign key (alley_id) references bowling_alley(alley_id),
foreign key (line_id) references alley_lines(line_id),
foreign key (tournament_id) references tournaments(tournament_id)
);

/* INSERTING */

insert into users(first_name,last_name,birthday,email,nationality) values
('Igor','Bidnij','1994-07-04','facebook_4722667@id.com','Ukraine' ),
('Osku', 'Palermaa', '1983-11-18','Osku@id.com','Finland'),
('Rihards', 'Kovalenko','2003-01-27','Rihards7@id.com','Latvia'),
('Ben','Robinson','2004-05-01','facebook_821510@id.com','United Kingdom'),
('Cedric','Fafin','1986-07-15','didic76@id.com','France'),
('Ashleigh','Gil','1996-05-14','Ashleigh691@id.com','Scotland');

Alter table bowling_alley 
add column name varchar(55) NOT NULL;

INSERT INTO bowling_alley(name,country,address) values
('Lucky Strike', 'Ukraine','Shevchenka BLvd,208/1,Cherkasy,Cherkasy Oblast,Ukraine'),
("John Scott's Partille", "Sweden", "Partille, Arenatorget 1,433 38"),
("Ice Bowl","United Kingdom", "Belfast, Old Dundonald RD 111"),
("Bowlero","Latvia", "Lielirbes street 27" ),
("Star Bowling", "Germany", "Am GroBmarkt 8, 555218 Ingelheim am Rhein"),
("La Bowl Ayr", "Scotland", "17 Miller Rd, Yar Ka7 2AX"),
("Bowling Plaza Grand-Quevilly", "France", "France,76120 Le Grand-Quevilldy, 22 boulevard Pierra Brossolette" ),
("Galeria Bowling", "Slovakia" , "Galeraibowling Kovise Toryska 5 05054011 Kosice Slovakia"),
("Bowling Della Martesna","Italy","Itali,20060 Pesssano con Bornago Mi , strada Provinciale 31"),
("Zemangale Bowling" , "Latvia", "Latvia, Jelgava, Skautuu Street 2");


/* REVIEW */

SELECT * FROM bowling_app.bowling_alley
where country like "Latvia";

insert into alley_lines  values
(1,1,1),
(2,2,11);

insert into alley_lines(line_num,alley_id)  values
('null','null');