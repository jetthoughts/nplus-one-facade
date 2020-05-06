SELECT row_number() OVER () AS id,
AVG(rate) AS avg_rate,
Films.id AS film_id,
Films.title AS film_title,
Films.genre AS film_genre
FROM Reviews
RIGHT OUTER JOIN Films ON Reviews.film_id=Films.id
GROUP BY Films.id;
