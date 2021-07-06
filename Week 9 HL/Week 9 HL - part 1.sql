use pets;
insert into pet_details(pet_name, pet_species, breed, microchipped)
values ('Miku', 'cat', 'short hair',  true),
 ('Cookie', 'cat', 'short hair', true),
 ('Tubs', 'hamster', 'russian', null),
 ('Miku', 'cat', 'short hair', true),
  ('Angie', 'cat', 'Maine', true),
 ('Rex', 'dog', 'Alsacian', true),
 ('Poochey poo', 'dog', null, true),
 ('Tristan', 'tortoise', null, true),
  ('Angus', 'cow', 'Aberdeen Angus', true),
 ('Salient', 'owl', null, null);

select * from pet_details;
update pet_details
set pet_name = 'Fifi'
where pet_name = 'Tristan'

select * from pet_details;
delete from pet_details
where pet_name	= 'Angus';
select * from pet_details;
 
#run a simple query
select pet_name from pet_details;

#run a complex query
select pet_name, pet_species from pet_details 

#sort by name
select pet_name, microchipped, breed from pet_details 
order by pet_species, microchipped 
 