SELECT AVG(rate), Films.id FROM Reviews JOIN Films ON Reviews.film_id=Films.id GROUP BY Films.id;
