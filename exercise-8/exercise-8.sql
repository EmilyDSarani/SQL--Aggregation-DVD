-- rank of film category by times rented
-- include the name, count, and rank

SELECT
category.name,
RANK() OVER (ORDER BY COUNT(rental.rental_date) DESC),
COUNT(rental.rental_date)
FROM rental
INNER JOIN inventory
ON inventory.inventory_id = rental.inventory_id
INNER JOIN film
ON inventory.film_id = film.film_id
INNER JOIN film_category
ON film.film_id = film_category.film_id
INNER JOIN category
ON film_category.category_id = category.category_id
GROUP BY
category.category_id
ORDER BY
RANK ASC;