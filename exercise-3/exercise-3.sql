-- the average rental amount by country
-- include the country name and avg amount
-- use AVG to average the amount
--  On Exercise 3 we found that the SQL file doesn’t specify that there needs to be an Order By Avg or a Limit 10 that you can see in the test -Katie

SELECT
    country.country,
    AVG(amount)
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
--then go to country
INNER JOIN country
--find the common ground
ON country.country_id = city.country_id
-- we still need to group by the country
GROUP BY country.country
-- we want to order by the avg in descending order
ORDER BY avg DESC
--still limit to 10
LIMIT (10)