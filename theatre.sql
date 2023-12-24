-- database of a movie theatre
create database theatre;

use theatre;
-- creating a table movies
create table movies(
movieid int(10) primary key,
moviename varchar(25) NOT NULL,
releasedate date,
ticketprice int,
buyprice int ,
check (buyprice>=0 AND buyprice <=  ticketprice + 100) 
);
-- creating a table viwers
create table viewers(
viewerid int primary key,
viewername varchar(25) NOT NULL,
email varchar(25),
age int
);
-- creating a table ticket
create table tickets(
ticketid int primary key,
showdatetime datetime,
screennumber int,
seatnumber int,
viewerid int,
movieid int,
foreign key (viewerid) references viewers(viewerid),
foreign key(movieid) references movies(movieid)
);
-- to see the table created
describe movies;

describe viewers;

describe tickets;



-- to insert into movies table
insert into movies values(1,'spiderman','2018-01-15',500,450),
(2,'ironman','2018-01-20',500,50),
(3,'avengers','2020-02-15',500,0),
(4,'loki','2023-03-19',500,600),
(5,'captain america','2021-01-08',500,500);
-- to insert into viwers table
insert into viewers values(1,'mr praksh','praksh@123',45),
(2,'praksh rai','pra123@',25),
(3,'raj shrestha','raj@123',15),
(4,'kamal limbu','kamal123@',60),
(5,'hari chettri','hari234@',50);

-- to insert into ticket table
insert into tickets values(1,'2018-01-15 10:00:00',5,45,1,2),
(2,'2018-01-20 12:00:00',1,25,1,3),
(3,'2020-02-18 01:00:00',2,15,2,4),
(4,'2023-03-19 02:00:00',4,10,3,5),
(5,'2021-01-08 10:00:00',1,5,5,5);

-- to view all the contain in the database
select * from movies;
select * from tickets;
select * from viewers;

-- to find the list of all the movies released in the month of jan 2018
select moviename from movies where movies.releasedate between '2017-12-30' and '2018-02-01';


-- to find the name and email of viewers whose name contains prakash
select viewername,email from viewers where viewers.viewername like'%praksh%';

-- sql to find the name of viewers of age not less than 18 yrs
select viewername from viewers where viewers.age>=18;