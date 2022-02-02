-- the total run time of all inventory items if they were all played back to back

--run time means length, i guess?

--so...we want just the sum?
SELECT 
    SUM(length)
--and...we will start at inventory    
FROM inventory
--just go to film
INNER JOIN film
--find the common ground
ON inventory.film_id = film.film_id
