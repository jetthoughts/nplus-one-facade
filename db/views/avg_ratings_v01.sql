SELECT AVG(rate), Films.id, Films.title, Films.genre FROM Reviews RIGHT OUTER JOIN Films ON Reviews.film_id=Films.id GROUP BY Films.id;
