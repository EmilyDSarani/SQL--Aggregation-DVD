-- customer ranking by total film time watched
-- similar to exercise 6

--so...we want just the sum?
SELECT 
    SUM(length)
--and...we will start at inventory    
FROM inventory
--just go to film
INNER JOIN film
--find the common ground
ON inventory.film_id = film.film_id