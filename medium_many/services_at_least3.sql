SELECT s.description, COUNT(cs.id) FROM services AS s
JOIN customers_services AS cs ON cs.service_id = s.id
GROUP BY s.id;

SELECT s.description, COUNT(cs.id) FROM services AS s
JOIN customers_services AS cs ON cs.service_id = s.id
GROUP BY s.id
HAVING COUNT(cs.id) >= 3;
