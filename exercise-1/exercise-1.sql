-- find the title and count of the top 10 most rented films
-- use COUNT to count each row
-- GROUP BY the film_id
-- ORDER in descending order
-- LIMIT 10

--We want to get to the film title 
SELECT 
    film.title,
-- then we want to use count and grab all the titles
    COUNT(*)
--we want to start from rentals
FROM
    rental 
--join at the inventory
INNER JOIN inventory
--find the common
ON inventory.inventory_id = rental.inventory_id
--move to the film
INNER JOIN film
--find the common 
ON inventory.film_id = film.film_id
--use group by to group the ids
GROUP BY 
    film.film_id
    --order by the count and have it descend
ORDER BY
    count DESC
    --limit to the top 10
LIMIT (10)

