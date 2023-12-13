-- List the meteorite name, latitude, longitude, country, populations and if it fall. 
SELECT m.name, m.reclat, m.reclong, c.city, c.country, c.population, m.fall
FROM meteorite AS m
INNER JOIN worldcities AS c
ON m.reclat = c.lat AND m.reclong = c.lon
ORDER BY c.country;

-- Top 5 Cities meteorites have fallen in the United States 
SELECT m.reclat, m.reclong, c.city, c.country, m.fall, COUNT(c.city)
FROM meteorite AS m
INNER JOIN worldcities AS c
ON m.reclat = c.lat AND m.reclong = c.lon
WHERE c.country = 'United States' AND fall = 'Fell'
GROUP BY m.reclat, m.reclong, c.city, c.country, m.fall
ORDER BY COUNT(c.city) DESC;


SELECT c.city, c.country, m.fall, COUNT(c.city) AS city_count
FROM meteorite AS m
INNER JOIN worldcities AS c
ON m.reclat = c.lat AND m.reclong = c.lon
WHERE c.country = 'United States' AND fall = 'Fell'
GROUP BY c.city, c.country, m.fall
ORDER BY city_count DESC;

SELECT m.reclat, m.reclong, c.city, c.country, m.fall,COUNT(c.city) AS city_count
FROM meteorite AS m
INNER JOIN worldcities AS c ON m.reclat = c.lat AND m.reclong = c.lon AND c.country = 'United States' AND m.fall = 'Fell'
GROUP BY m.reclat, m.reclong, c.city, c.country, m.fall
ORDER BY city_count DESC;

-- Top 5 cities meteorites have been found in the world
SELECT m.reclat, m.reclong, c.city, c.country, m.fall, COUNT(*) AS city_count
FROM meteorite AS m
INNER JOIN worldcities AS c
ON m.reclat = c.lat AND m.reclong = c.lon
WHERE fall = 'Found'
GROUP BY m.reclat, m.reclong, c.city, c.country, m.fall
ORDER BY city_count DESC
LIMIT 5;

SELECT geolocation, COUNT(fall)
FROM meteorite WHERE recclass LIKE '%Pallasite%' Group by 1;