SELECT row_number() OVER () AS id,
AVG(rate) AS rate,
Films.id AS film_id,
Films.title AS title,
Films.genre AS genre
FROM Reviews
RIGHT OUTER JOIN Films ON Reviews.film_id=Films.id
GROUP BY Films.id;
