create DATABASE Garage 
use Garage
create table Location (
l_ID int primary key , 
l_Address varchar(255) ,
l_City varchar(255) ,
);
create table Vehicle (
v_ID int primary key , 
v_ModelNumber int , 
v_Type varchar(255) ,
l_ID int foreign key references Location (l_ID)
);

create table Customer (
c_ID int primary key , 
c_Name varchar(255) ,
c_Address varchar(255) ,
c_PhoneNumber int ,
);

create table Reservation (
r_ID int primary key , 
r_CustomerName varchar(255) ,
r_LocationAddress varchar(255) ,
r_ModelNumber int , 
l_ID int foreign key references Location (l_ID),
v_ID int foreign key references Vehicle (v_ID),
c_ID int foreign key references Customer (c_ID)
);

create table Rental (
e_ID int primary key , 
e_CustomerName varchar(255) ,
e_LocationAddress varchar(255) ,
e_ModelNumber int , 
e_PickupDate int ,
e_ReturnDate int ,
c_ID int foreign key references Customer (c_ID),
l_ID int foreign key references Location (l_ID)
);




insert into  Vehicle (v_id , v_ModelNumber , v_Type)
values (1 , 5532 ,'kia');
insert into Location(l_ID , l_Address , l_City) 
values (2 , 'elkantara' ,'kafer el-sheikh');
insert into Customer (c_ID , c_Name , c_Address , c_PhoneNumber)
values (3 , 'yaseen' , 'alex.' , 1234);
insert into Reservation(r_ID , r_CustomerName, r_LocationAddress , r_ModelNumber, c_ID, l_ID)
values (4 , 'yaseen' , 'alex.' , 1234, 3, 2);
insert into Rental (e_ID , e_CustomerName , e_LocationAddress , e_ModelNumber , e_PickupDate , e_ReturnDate )
values (5 , 'yaseen' , 'alex' , 1234 , 1/5/2020 , 1/6/2020 ); 

insert into  Vehicle (v_ID , v_ModelNumber , v_Type)
values (6 , 1122 , 'B M W');
insert into Location(l_ID , l_Address , l_City) 
values (7 , 'kafr el_dawar' ,'Elbehira');
insert into Customer (c_ID , c_Name  ,c_Address , c_PhoneNumber)
values (8 , 'Mohamed' , 'Elbehira' , 4321);
insert into Reservation(r_ID , r_CustomerName, r_LocationAddress , r_ModelNumber, l_ID)
values (9 , 'Mohamed' , 'kafr el_dawar' , 4321, 7);
insert into Rental (e_ID , e_CustomerName , e_LocationAddress , e_ModelNumber , e_PickupDate , e_ReturnDate )
values (10 , 'Mohamed', 'kafr el_dawar' , 4321 , 2/5/2020 , 2/6/2020 ); 


select c_Name , r_LocationAddress 
from Customer 
inner join Reservation on Customer.c_ID = Reservation.c_ID ;
select e_LocationAddress , c_address 
from Rental 
left join Customer on Rental.c_ID = Customer.c_ID ;
select e_CustomerName , e_LocationAddress 
from Customer 
right join Rental on Rental.c_ID = Customer.c_ID ;
select l_city , v_Type
from Location
full join Vehicle on Location.l_ID = Vehicle.v_ID ;
select l_City , r_ModelNumber
from Location , Reservation 
where Location.l_ID = Reservation.l_ID ;

select count(c_PhoneNumber) , c_Name
from Customer 
group by c_name ; 
--find count of all customers
select count (*)
from Customer
group by c_Name; 
--find all location addresses in rental where id is 2:
select e_LocationAddress
from Rental  
where e_ID = (select e_ID from Location where l_ID = 2) ; 
--find location address and model number of reservation:
select r_LocationAddress , r_ModelNumber
from Reservation 
where r_ModelNumber > (select count(c_ID) from Customer ) ; 
--find the model number of vehicle:
Select v_ModelNumber 
From vehicle  ; 
--how to select the vehicle type:
select v_Type
from Vehicle;
--Query to get all customers information:
select * 
from Customer ;
--list all cities in location:
select distinct l_City 
from Location ;
--list customer information
SELECT TOP 10 * 
FROM Customer ;
--find the location address of the reservation
SELECT TOP 10 PERCENT r_LocationAddress
FROM Reservation ; 
--How to select vehicle id orderd by the type of it:
SELECT v_ID 
FROM Vehicle
ORDER BY v_Type ;
--find customer phone number
SELECT c_PhoneNumber 
FROM Customer;
--List all info about customer descending order:
SELECT * 
FROM Customer
ORDER BY c_PhoneNumber desc ;
--LIst all reservation in ascending order:
SELECT  *
FROM Reservation
ORDER BY r_ModelNumber ASC;
SELECT MIN(e_ModelNumber)
FROM Rental ;
select MAX(e_ModelNumber)
from Rental ; 
SELECT AVG(e_PickupDate)
FROM Rental ;
SELECT SUM(e_ReturnDate)
FROM Rental ;
--How to select all info about vehicle:
SELECT *
FROM Vehicle
WHERE v_ID = 1 ;
--How to select customer name:
SELECT c_Name
FROM customer
WHERE c_Name LIKE 'y%';
--find all types os vehicle
Select v_Type  
From vehicle  ; 
--How to make the location as my location address:
SELECT r_LocationAddress AS MyLocationAddress
FROM Reservation;
--find all details about rental which start in 1/5/2020 and ends in 3/5/2020:
SELECT *
FROM Rental
WHERE e_PickupDate BETWEEN 1/5/2020 AND 3/5/2020 ;
--find customer phone number and name whose name starts with 'm'  
SELECT c_PhoneNumber , c_Name
FROM Customer
WHERE c_Name IN ('yaseen', 'mohamed' ) AND c_Name LIKE 'm%' ;
--find the location address of rental that starts with 'k'
SELECT e_LocationAddress
FROM Rental
WHERE e_LocationAddress IN ('kafr el_dawar', 'alex' ,'giza') or e_LocationAddress LIKE '%k%' ;
--how to select a customer name: 
SELECT c_Name
FROM Customer
WHERE NOT c_Name= 'yaseen'; 

update Vehicle 
set v_type = 'mercedes'
where v_ID = 1 ;
update Location
set l_Address = 'Giza'
where l_ID = 2 ;
update Reservation
set r_ModelNumber = 8888
where r_ModelNumber= 1234 ;
update Rental
set e_PickupDate = 30/5/2020
where e_ReturnDate = 1/6/2020 ;
update Customer
set c_Name = 'ali'
where c_Address = 'alex.' ;



delete from Vehicle where v_ID = 6 ;
delete from Customer where c_address = 'Elbehira' ;
delete from Reservation where r_ModelNumber = 4321 ;
delete from Location where l_Address = 'kafr el_dawar' ;
delete from Rental where e_PickupDate= 2/5/2020 ;



