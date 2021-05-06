SELECT DISTINCT c.* FROM customers AS c
LEFT OUTER JOIN customers_services AS cs ON cs.customer_id = c.id
WHERE service_id IS NULL;

SELECT DISTINCT c.*, s.* FROM customers AS c
LEFT OUTER JOIN customers_services AS cs ON cs.customer_id = c.id
FULL OUTER JOIN services AS s ON s.id = cs.service_id
WHERE c.id IS NULL OR s.id IS NULL;
