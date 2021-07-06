drop database pets;
create database pets;
use pets;
create table pet_details (
 pet_name  varchar(20) not null,
 pet_species varchar(20) not null,
 breed  varchar(20),
 microchipped bool, 
 vaccinated bool,
 reg_id int unique auto_increment,
primary key (reg_id)
);

explain pet_details;


 