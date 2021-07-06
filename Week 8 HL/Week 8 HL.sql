#drop database pets;
create database pets;
use pets;

#drop table pet_details;

create table pet_details (
 pet_name  varchar(20) not null,
 pet_species varchar(20) not null,
 breed  varchar(20),
 microchipped bool, 
 reg_id int unique auto_increment,
primary key (reg_id)
);

explain pet_details;