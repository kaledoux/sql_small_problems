SELECT s.id, s.price FROM services AS s;

SELECT s.id, s.price, COUNT(cs.service_id) FROM services AS s
JOIN customers_services AS cs ON cs.service_id = s.id
GROUP BY s.id;

SELECT s.id, (s.price * COUNT(cs.service_id)) AS service_cost FROM services AS s
JOIN customers_services AS cs ON cs.service_id = s.id
GROUP BY s.id;

SELECT (s.price * COUNT(cs.service_id)) AS service_cost FROM services AS s
JOIN customers_services AS cs ON cs.service_id = s.id
GROUP BY s.id;

-- # final answerl instead of finding the cost of each service then totalling,
-- just find the sum of each individual service! Don't make it more complicated
-- then it needs to be!

SELECT SUM(s.price) AS gross FROM customers_services AS cs
JOIN services AS s ON cs.service_id = s.id;
