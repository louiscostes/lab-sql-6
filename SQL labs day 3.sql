--                          Lab | SQL Queries 5

-- Drop column picture from staff.

use sakila;

alter table sakila.staff
drop column picture;
select * from sakila.staff;

-- TAMMY SANDERS, hired,  and she is a customer. Update the database accordingly.

select * from sakila.customer
where first_name = 'TAMMY' and last_name = 'SANDERS';

insert into sakila.staff(staff_id, first_name, last_name, address_id, email, store_id, active, username, password, last_update)
values ('3', 'Tammy', 'Sanders', '79', 'TAMMY.SANDERS@sakilacustomer.org', '2', '1', 'Tammy', ' ', current_date()); 

select*from sakila.staff;


-- Add rental for movie "Academy Dinosaur" 
-- by Charlotte Hunter from Mike Hillyer at Store 1 today

show fields from rental;

insert into rental 
values(16050, 
      curdate(), 
      1,
      (select customer_id from customer where first_name = 'Charlotte' and last_name = 'Hunter'), 
      null,
      (select staff_id from staff where first_name = 'Mike'), current_date);

select*from sakila.rental;


-- Delete non-active users, but first, create a backup table deleted_users 
-- to store customer_id, email, and the date the user was deleted.

select * from sakila.customer
where active = 0;

insert into sakila.deleted_users (customer_id, email, date_deleted)
values(customer_id, email, current_date()); 

select * from sakila.deleted_users;


--                                 Lab | SQL Queries 6

-- Add the new films to the database.
use sakila;
select*from sakila.film;

-- loading csv file
show variables like 'local_infile';
set global local_infile = 1;

load data local infile './lab-sql-6/films_2020.csv '
into table film 
fields terminated by ','; 


-- update inventory




