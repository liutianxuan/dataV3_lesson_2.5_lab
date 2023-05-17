use sakila;

# 1. Select all the actors with the first name ‘Scarlett’.
SELECT * FROM actor
WHERE first_name = 'Scarlett';

# 2. How many physical copies of movies are available for rent in the store's inventory? How many unique movie titles are available?
SELECT count(inventory_id) FROM inventory;
SELECT count(DISTINCT film_id) FROM inventory;

# 3. What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT length FROM film;
SELECT MAX(length) as max_duration FROM film;
SELECT MIN(length) as min_duration FROM film;

# 4. What's the average movie duration expressed in format (hours, minutes)?
SELECT concat(floor(AVG(length)/60),'h', round(AVG(length)%60,0),'m') as average_duration 
FROM film;

# 5. How many distinct (different) actors' last names are there?
SELECT DISTINCT count(last_name) FROM actor;

# 6. How many days was the company operating? Assume the last rental date was their closing date. (check DATEDIFF() function)
SELECT DATEDIFF(MAX(rental_date), MIN(rental_date)) FROM rental;

# 7. Show rental info with additional columns month and weekday. Get 20 results.
SELECT *, monthname(rental_date) as month, dayname(rental_date) as weekday FROM rental
LIMIT 20;

# 8. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT *, IF(dayofweek(rental_date)<=5, 'workday','weekend') AS day_type FROM rental;

# 9. Get release years.
SELECT release_year FROM film;

# 10. Get all films with ARMAGEDDON in the title.
SELECT * FROM film
WHERE title LIKE '%ARMAGEDDON%';

# 11. Get all films which title ends with APOLLO.
SELECT * FROM film
WHERE RIGHT(title,LENGTH('APOLLO')) = 'APOLLO';

# 12. Get 10 the longest films.
SELECT title, length FROM film
ORDER BY length DESC
LIMIT 10;

# 13. How many films include Behind the Scenes content?
SELECT count(title) FROM film
WHERE special_features LIKE '%Behind the Scenes%';
