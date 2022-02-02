-- the top 10 cities with the most total rental payment amount
-- include the city name and sum
-- use SUM to sum up the amounts

-- we want the city and the sum as an amount
SELECT
    city.city,
--when we get the sum as amount, we want it to return back as the sum itself...
    SUM(amount) AS sum
-- start at payments
FROM payment
-- then we want to join at customer
INNER JOIN customer
--find the common ground
ON payment.customer_id = customer.customer_id
--move on to address
INNER JOIN address
--find the common ground
ON address.address_id = customer.address_id
--then move down to city
INNER JOIN city
--find that common ground
ON address.city_id = city.city_id
--group by the city id
GROUP BY city.city_id
--order by the sum in descending order
ORDER BY sum DESC
--limit to the top 10
LIMIT (10)
