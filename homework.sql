use sakila;
/*1a. Display the first and last names of all actors 
from the table actor*/
SELECT first_name, last_name FROM actor
/*1b. Display the first and last name of each actor in a single column 
in upper case letters. Name the column Actor Name.*/
ALTER TABLE actor 
ADD Actor_Name varchar(30); 
SET SQL_SAFE_UPDATES = 0;
UPDATE actor
SET Actor_Name = concat(first_name, ' ', last_name);
select * from actor
/*2a. You need to find the ID number, first name, and last name of an actor,
 of whom you know only the first name, "Joe." What is one query would you 
 use to obtain this information?*/
SELECT actor_id, Actor_Name 
FROM actor
WHERE first_name = "JOE";
 /*2b. Find all actors whose last name contain the letters GEN:*/
SELECT Actor_Name 
FROM actor 
WHERE last_name like "%GEN%";
/*2c. Find all actors whose last names contain the letters LI.
 This time, order the rows by last name and first name, in that order*/
SELECT last_name, first_name
FROM actor
WHERE last_name like "%LI%";
/*2d. Using IN, display the country_id and country columns of the
 following countries: Afghanistan, Bangladesh, and China*/
 SELECT country_id, country 
 from country
 WHERE country in ("Afghanistan", "Bangladesh", "China");
/*3a. You want to keep a description of each actor. You don't think 
you will be performing queries on a description, so create a column 
in the table actor named description and use the data type BLOB 
(Make sure to research the type BLOB, as the difference between it 
and VARCHAR are significant).*/
ALTER TABLE actor 
ADD description BLOB;
/*3b. Very quickly you realize that entering descriptions for each 
actor is too much effort. Delete the description column*/
ALTER TABLE actor
DROP COLUMN description;
/*4a. List the last names of actors, as well as how many actors
 have that last name.*/
SELECT last_name, COUNT(last_name) as "Number Of Actors With Last Name"
FROM actor
WHERE last_name = last_name
GROUP BY last_name;
/*4b. List last names of actors and the number of actors who have 
that last name, but only for names that are shared by at least two 
actors*/
SELECT last_name, COUNT(last_name) as "Number Of Actors With Last Name"
FROM actor
WHERE last_name = last_name
GROUP BY last_name
HAVING (COUNT(last_name)) > 1;
/*4c. The actor HARPO WILLIAMS was accidentally entered in the actor
 table as GROUCHO WILLIAMS. Write a query to fix the record.*/
UPDATE actor
SET first_name = "HARPO", Actor_Name = "HARPO WILLIAMS"
WHERE Actor_Name = "GROUCHO WILLIAMS";
SELECT * FROM actor
/*4d. Perhaps we were too hasty in changing GROUCHO to HARPO. It 
turns out that GROUCHO was the correct name after all! In a single 
query, if the first name of the actor is currently HARPO, change it 
to GROUCHO.*/
UPDATE actor
SET first_name = "GROUCHO", Actor_Name = "GROUCHO WILLIAMS"
WHERE Actor_Name = "HARPO WILLIAMS";
SELECT * FROM actor
/*5a. You cannot locate the schema of the address table. Which query 
would you use to re-create it?*/
SHOW CREATE TABLE address;
/*6a. Use JOIN to display the first and last names, as well as the
 address, of each staff member. Use the tables staff and address:*/
SELECT staff.first_name, staff.last_name, address.address
FROM address
INNER JOIN staff on address.address_id=staff.address_id;
/*6b. Use JOIN to display the total amount rung up by each staff 
member in August of 2005. Use tables staff and payment.*/
SELECT * FROM payment
SELECT staff.first_name, staff.last_name, sum(amount) as total
FROM payment
INNER JOIN staff ON payment.staff_id=staff.staff_id
WHERE payment_date>="2005/08/01" and payment_date<="2005/08/31"
GROUP BY staff.staff_id; 
/*6c. List each film and the number of actors who are listed for 
that film. Use tables film_actor and film. Use inner join.*/
select * from film
SELECT film_id, count(actor_id)
FROM film
INNER JOIN film_actor ON film.film_id=film_actor.film_id
GROUP BY film.film_id;


 


 



