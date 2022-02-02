-- the average film length by category
-- include the category name and avg length

SELECT
--we want the category name
category.name,
--grab the average length
AVG(length)
--start at film
FROM film
-- join at film_category
INNER JOIN film_category
--find the common ground
ON film.film_id = film_category.film_id
--join at category
INNER JOIN category
--find the common ground
ON category.category_id = film_category.category_id
--group by the name
GROUP BY category.name

