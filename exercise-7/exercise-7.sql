-- customer ranking by total film time watched
-- similar to exercise 6

--so...we want just the sum?
SELECT
customer.email,
RANK() OVER (ORDER BY SUM(film.length) DESC)
--start a customer
FROM film
--go through inventory
INNER JOIN inventory
--find the common ground
ON inventory.film_id = film.film_id
--go to rental
INNER JOIN rental
--find the common ground
ON rental.inventory_id = inventory.inventory_id
--go through customer
INNER JOIN customer
--find the common ground
ON rental.customer_id = customer.customer_id
--group by the email
GROUP BY
customer.email
--order by the rank asc
ORDER BY
 RANK ASC;