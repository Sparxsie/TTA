use pets;
#drop table VaccinationDetails;

# second table
create table VaccinationDetails (
VaccinationDate	date not null,
VaccinationName varchar(20),
Pet_Id int,
primary key (Pet_Id, VaccinationDate,VaccinationName) 
);

#enter data in second table
select * from VaccinationDetails;
insert into VaccinationDetails ( ) 
values (date("2020-03-01"), "Initial", 1),
(date("2020-08-01"), "Initial", 10),
(date("2020-04-01"), "Initial", 6),
(date("2021-03-01"), "Initial", 8),
(date("2021-03-01"), "Booster", 1),
(date("2020-09-01"), "Initial", 4),
(date("2021-05-01"), "Initial", 3);

#join tables and show where joined 
select * from VaccinationDetails as VD
inner join pet_details as pd
on VD.Pet_Id = pd.reg_id;

# count all vaccinations this year - simple query
select VaccinationName as Vaccine, count(VaccinationName) as 'Number' from VaccinationDetails
where year(VaccinationDate) = 2021
group by VaccinationName;

# show all animals which are vaccinated - complex query on join
select pet_name, pet_species, microchipped, VaccinationName, VaccinationDate from VaccinationDetails as VD
inner join pet_details as pd
on VD.Pet_Id = pd.reg_id
order by VaccinationDate,VaccinationName, pet_name;

# show which animals not vaccinated this year - filter data using comparison
select pet_name,pet_species, microchipped, VaccinationName, VaccinationDate from VaccinationDetails as VD
inner join pet_details as pd
on VD.Pet_Id = pd.reg_id
where (year(vaccinationDate) < 2021)
order by Pet_name, VaccinationDate,VaccinationName;

# show which animals aren't vaccinated at all - complex query with filter
select pet_name, pet_species from pet_details 
left join vaccinationDetails as vd
on Pet_Id = reg_id
where VaccinationDate is null
order by pet_species, pet_name