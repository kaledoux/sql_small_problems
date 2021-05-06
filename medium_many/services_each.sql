SELECT c.name, string_agg(s.description, ', ') FROM customers AS c
LEFT OUTER JOIN customers_services AS cs ON cs.customer_id = c.id
LEFT OUTER JOIN services AS s ON s.id = cs.service_id
GROUP BY c.id;
