SELECT SUM(s.price) AS current_big_ticket FROM customers_services AS cs
JOIN services AS s ON s.id = cs.service_id
WHERE s.price > 100.00;

SELECT COUNT(c.id) AS total_customers FROM customers AS c;

SELECT SUM(services.price) FROM services
WHERE price > 100.00;

-- combine the two previous queries
SELECT COUNT(c.id) *
  (
  SELECT SUM(services.price)
  FROM services
  WHERE price > 100.00
  )
  AS total_possible_big_ticket
FROM customers AS c;
