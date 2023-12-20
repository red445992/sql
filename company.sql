create database company;

use company;

create table employee(
empid int primary key,
firstname varchar(25),
lastname varchar(25),
birthday int,
sex varchar(1),
salary int,
superid int,
branchid int
);

describe employee;

create table branch(
branchid int primary key,
branchname varchar(25),
mgrid int,
mgr_start_date date,
foreign key (mgrid) references employee(empid) on delete set null 
);

alter table employee 
add foreign key (branchid)
references branch(branchid)
on delete set null;

alter table employee 
add foreign key (superid)
references employee(empid)
on delete set null;

create table client (
clientid int primary key,
clientname varchar(25),
branchid int ,
foreign key(branchid) references branch(branchid) on delete set null
);

create table works_with(
empid int,
clientid int,
totalsales int,
primary key (empid,clientid),
foreign key(empid) references employee(empid) on delete cascade,
foreign key(clientid) references client(clientid) on delete cascade

);

create table branch_supplier(
branchid int,
suppliername varchar(25),
supplytype varchar(25),
primary key(branchid,suppliername),
foreign key(branchid) references branch(branchid) on delete cascade
);
alter table employee modify column birthday date;
insert into employee values(100,'aditya','thakuri','2005-06-27','M',10000,null,null);

INSERT INTO branch values (1,'corporate',100,'2010-02-13');

update employee
set branchid =1
where empid=100;

insert into employee values(101,'nischal','dangol','2006-04-25','F',5000,100,1);
insert into employee values(102,'indus','pokharel','2004-02-25','M',50000,101,null);

insert into branch values(2,'account', 101, '2009-10-23');

update employee
set branchid =2
where empid=102;
 insert into employee values(103,'puzan','thakuri','2000-02-13','M',60000,101,2);

-- branch supplier
insert into branch_supplier values(1,'hammermill','paper');
insert into branch_supplier values(1,'uniball','writing');
insert into branch_supplier values(2,'pp','custom');
insert into branch_supplier values(2,'factory','cotton');

-- client table

insert into client values(400, ' highschool', 2);
insert into client values(401, 'fedex', 1);
insert into client values(402, 'law', 1);

-- works with table

insert into works_with values(100,400,5000);
insert into works_with values(101,401,50000);
insert into works_with values(103,402,2000);

select * from employee;

select * from works_with;

select *from client;

select * from branch;



select * from employee
order by sex, firstname,lastname;

select count(sex),sex
from employee
group by sex;

