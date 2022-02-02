-- CUBE of amount made per year, month, day, and film rating
-- similar to exercise 9 but include the rating with joins
-- replace ROLLUP with CUBE

--extract the year, month and day
SELECT
    EXTRACT(YEAR FROM payment_date) AS y,
    EXTRACT(MONTH FROM payment_date) AS m,
    EXTRACT(DAY FROM payment_date) AS d,
--then get the payment amound sum
    SUM(payment.amount),
--get the film rating    
    film.rating
FROM
--start at payment
    payment
--go to rental    
INNER JOIN rental
--find the common ground
ON rental.rental_id = payment.rental_id
--go to inventory
INNER JOIN inventory
--then find the common ground
ON inventory.inventory_id = rental.inventory_id
--then go to film
INNER JOIN film
--then find the common ground
ON film.film_id = inventory.film_id
--CUBE GROUP in order, and dont forget the film.rating. really the only thing we dont need is sum here because that is calculating...
GROUP BY
    CUBE(y, m, d, film.rating)
--THEN order by what is in the cube      
ORDER BY
     film.rating, y, m, d
