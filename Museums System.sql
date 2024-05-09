-- !!!our system is for storing all data about all museums in egypt not only one museum!!!!!
create database Museum_Systems;
use Museum_Systems;
create table Department(	
	dept_id int not null,
    dept_name varchar(20),
    descripption varchar(100),
    primary key(dept_id)
    
);
create table Museum (
	mus_id int not null,
    capacity int ,
    collection_size int,
    mus_name varchar(25),
    dept_id int,
    location varchar(50),
    foundation_date date,
    primary key (mus_id),
    foreign key (dept_id) references Department(dept_id)
);
create table Eventt(
	event_id int not null,
    descripption varchar(150),
    title varchar(25),
    location varchar(50),
    event_date date,
    mus_id int not null,
    primary key (event_id),
    foreign key (mus_id) references museum(mus_id)
    
    
);
create table Employee(
	emp_id int not null,
    fname varchar(50),
    lname varchar (50),
    salary int ,
    position varchar(20),
    email varchar(150),
	birth_day int,
    birth_month varchar(10),
    birth_year int,
    dept_id int not null,
    age int,
	primary key(emp_id),
    foreign key (dept_id) references Department (dept_id)
);
create table Event_ticket(
		ticket_id int not null,
        event_id int not null,
        price int,
        payment_system varchar(25),
        purchase_date date,
        visitor_id int,
        primary key (ticket_id),
        foreign key (event_id) references Eventt(event_id)
);
create table Director(
	dir_id int not null,
	mus_id int not null,
    email varchar(150),
    phone int,
    empname varchar(100),
    primary key (dir_id),
    foreign key (mus_id) references museum (mus_id)  
);
create table Visitor(
visitor_id int not null primary key,
visitor_name varchar(30) not null,
contact_information int ,
ticket_type varchar(30) not null,
mus_id int not null,
foreign key(mus_id)references Museum(mus_id)); 

create table Museum_ticket(
ticket_id int not null primary key,
mus_name varchar(25),
visitor_id int not null ,
ticket_type varchar(20) not null,
payment_system varchar(30) not null,
price float(24) not null,
purchase_date datetime not null,
foreign key(visitor_id)references Visitor(visitor_id));

create table Feedback(
fed_id int not null primary key,
Date_f datetime not null ,
comments varchar(200) not null,
visitor_id int not null,
foreign key(visitor_id)references Visitor(visitor_id) );

create table Membership(
member_id int not null primary key,
visitor_id int not null,
start_date datetime not null,
end_date datetime not null,
type_m varchar(20) not null,
foreign key(visitor_id) references Visitor(visitor_id) );

create table Gift_shop_item(
item_id int not null primary key,
item_name varchar(20) not null,
price float(4) not null,
description varchar(30) ,
quantity int);
create table Gift_shop(
giftshop_id int not null,
gshop_name varchar(30) not null,
item_id int not null,
location varchar(30),
visitor_id int not null,
foreign key(visitor_id) references Visitor(visitor_id),
foreign key(item_id) references Gift_shop_item(item_id));

create table Researcher (
    researcher_id int ,
    researcher_name varchar(50) not null,
    affiliation varchar(50),
    email varchar(50) ,
    primary key(researcher_id)
);
create table Artifact (
      artifact_id int ,
      researcher_id int ,
      artifact_value varchar(50),
      artifact_name varchar(50) not null,
      origin varchar(50),
      artifact_description varchar(50),
      acquisition_date varchar(50),
      dept_id int not null,
      primary key(artifact_id),
      foreign key (researcher_id) references Researcher(researcher_id),
      foreign key (dept_id) references Department(dept_id)
);
create table Research(
      research_id int ,
      researcher_id int ,
      artifact_id int ,
      research_description varchar(50),
      title varchar(30) not null ,
      start_date varchar(30),
      end_date varchar(30),
      primary key(research_id),
      foreign key (researcher_id) references Researcher(researcher_id),
      foreign key (artifact_id) references Artifact(artifact_id)
);

insert into department values (123,"egyptology","contains ancient egypt artifatcs"),
 (456,"islamic","contains islamic artifacts") ,
(789,"greek","contains artifacts from greek");

insert into museum values (12,10000,2500,"great egyptian","123","cairo,egypt","1990-12-1"),
(15,7000,1678,"alex museum","789","alex,egypt","2000-11-8"),
(17,8000,4568,"luxur museum","123","luxur,egypt","1995-4-15"),
(20,4700,1500,"hurgada museum","456","hurgrada,egypt","2004-11-8");

insert into Visitor values(1,'Haneen',011427111,'Egyptian Student',12),
(2,'Ali',010425111,'Egyptian Adults',12),
(3,'Raya',01185271,'German Student',12),
(4,'Hannah',012755111,'American Adults',12);

insert into Museum_ticket values(00001,'Egyptian museum',1,'Egyptian Student','cash',10,'2024-04-27 08:15:25'),
(00002,'Egyptian museum',2,'Egyptian Adults','cash',30,'2024-04-27 08:17:15'),
(00003,'Egyptian museum',3,'German Student','cash',230,'2024-04-27 08:18:05'),
(00004,'Egyptian museum',4,'American Adults','cash',450,'2024-04-27 08:22:26');

insert into Feedback values(001,'2024-04-27 09:35:25','Very good place',1),
(002,'2024-04-27 10:35:25','Best place ever',3),
(003,'2024-04-28 11:35:25','would like to come her again',4);

insert into Membership values(001,1,'2024-04-01 10:35:25','2025-04-01 10:35:25','Student'),
(002,2,'2024-01-01 10:35:25','2025-01-01 10:35:25','Professional');

insert into Gift_shop_item values(0111,'Isis statue',100,'20cm*30cm',10),
(0112,'Tut ankh amon statue',250,'20cm*30cm',20);

insert into Gift_shop values(01,'Isis',0111,'Ground floor',1),
(01,'Isis',0112,'Ground floor',3);

insert into Eventt values (1,"russian president visit to alex museum","honorable russian visit","alex museum","2021-12-10",15),
(2,"egyptian vice president opening hurgada museum","hurgada museum opening","hurgada museum","2004-11-8",20),
(3,"celebrating the return of tutankmun mask","tutankhmun is back","egyptian museum","2010-5-4",12),
(4,"zahi hawas press conference","great ancient egypt","luxur museum","2022-2-22",17);

insert into Employee values (97,"ahmed","ali",6000,"archeologist","ahmedali@gmail.com",1,"nov",1990,"789",34),
(114,"mona","hussain",7000,"egyptologist","monahussain@gmail.com",14,"mar",1985,"123",39),
(859,"abdo","malek",4100,"goverment tourguide","abdosss123",27,"august",1999,"456",25);

insert into event_ticket values (1000,2,50,"paypal","2021-2-15",1),
(2000,3,120,"vodafone cash","2022-4-18",2),
(3000,4,30,"cash","2023-10-25",3),
(4000,1,200,"instapay","2024-5-22",4);

insert into Director values (11,12,"hussainali@gmail.com","01278965411","hussain ali"),
(77,15,"aligamal123@gmail.com","01234567891","ali gamal"),
(44,17,"mohamedsalah@gmail.com","0175984326","mohamed salah"),
(50,20,"monanagy@gmail.com","01289483267","mona nagy");

INSERT INTO Researcher (researcher_id, researcher_name, affiliation, email) VALUES 
(1, 'John Smith', 'University of XYZ', 'john.smith@example.com'),
(2, 'Emily Johnson', 'Research Institute ABC', 'emily.johnson@example.com'),
(3, 'Michael Brown', 'Museum of Artifacts', 'michael.brown@example.com');

INSERT INTO Artifact (artifact_id, researcher_id, artifact_value, artifact_name, origin, artifact_description, acquisition_date, dept_id) VALUES
(1, 1, 'High', 'Ancient Vase', 'Greece', 'An ancient ceramic vase', '2023-05-15', 789),
(2, 2, 'Medium', 'Medieval Sword', 'England', 'A medieval sword from the 14th century', '2023-07-20', 456),
(3, 3, 'Low', 'The Sarcophagus of Tutankhamun', 'Egypt', 'A clay tablet with cuneiform script', '2023-09-10', 123);

INSERT INTO Research (research_id, researcher_id, artifact_id, research_description, title, start_date, end_date) VALUES
(1, 1, 1, 'Study on ancient Greek pottery', 'Ancient Greek Pottery Study', '2023-06-01', '2023-08-30'),
(2, 2, 2, 'Investigation into medieval weaponry', 'Medieval Weaponry Research', '2023-09-01', '2023-12-15'),
(3, 3, 3, 'Analysis of cuneiform writing', 'Cuneiform Writing Study', '2024-01-01', '2024-03-31');

select artifact_name from Artifact where researcher_id IN (SELECT researcher_id FROM Researcher WHERE researcher_name LIKE '%John%');
select * from Feedback F NATURAL JOIN Visitor V ;
select * from Eventt where mus_id in (select mus_id from museum where location = "cairo,egypt"); 
select * from Employee inner join Department on Employee.dept_id = Department.dept_id;
select min(salary) as min_salary from Employee;
select count(emp_id) as employees_count from Employee;
select max(capacity) as max_capacity from museum;
update Employee set salary=salary*2 where position='archeologist';



