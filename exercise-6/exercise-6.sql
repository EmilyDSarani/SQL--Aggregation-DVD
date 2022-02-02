-- customer ranking by total amount spent
-- include email and rank
-- use RANK ORDER BY the SUM of the amount in descending order

--we want the customer...so maybe the id
--the sum of the amount
--rank-- this is the window thing Dan talked about

--we want the email and the rank, which is a window agg
SELECT
customer.email,
RANK() OVER (ORDER BY SUM(payment.amount) DESC)
--start a customer
FROM customer
--GO THROUGH RENTAL SMH
INNER JOIN rental
--find the common ground
ON rental.customer_id = customer.customer_id
--go to payment
INNER JOIN payment
--find the common ground
ON rental.rental_id = payment.rental_id
--group by the email
GROUP BY
customer.email
--order by the rank asc
ORDER BY
 RANK ASC;

