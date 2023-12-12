SELECT m.name, m.reclat, m.reclong, c.city, c.country, c.population, m.fall
FROM meteorite AS m
INNER JOIN worldcities AS c
ON m.reclat = c.lat AND m.reclong = c.lon
ORDER BY c.country;